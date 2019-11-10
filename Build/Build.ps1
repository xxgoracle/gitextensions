[CmdletBinding(PositionalBinding=$false)]
Param(
  [string]$Version,
  [string][Alias('c')]$Configuration = "Debug",
  [string][Alias('v')]$verbosity = "minimal",
  [switch]$restore,
  [switch][Alias('b')]$build,
  [switch]$rebuild,
  [switch]$loc,
  [switch][Alias('t')]$test,
  [switch] $pack,
  [switch][Alias('bl')]$binaryLog,
  [switch] $dontVersion = $false,
  [switch] $help,
  [Parameter(ValueFromRemainingArguments=$true)][String[]]$properties
)

# break on errors
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"
$PSDefaultParameterValues['*:ErrorAction'] = 'Stop'

$env:SKIP_PAUSE=1
$LastExitCode = 0
$TfmConfiguration = "$Configuration\net461";

Push-Location $PSScriptRoot\..\

$Solution = ".\GitExtensions.sln";

try{
    if ($restore) {
        Write-Host "[LOG] Restoring packages" -ForegroundColor Green
        .\.nuget\nuget.exe update -self
        .\.nuget\nuget.exe restore -Verbosity Quiet $Solution
    }

    if ($build -eq $true -or $rebuild -eq $true) {
        if ($dontVersion -eq $false) {
            if ([string]::IsNullOrWhiteSpace($Version)) {
                throw "Version is required"
            }

            $python = "python";
            if ($env:APPVEYOR) {
                $python = "C:\Python35\python";
            }
            else {
                [string[]]$PythonPaths = & where.exe python
                if (!$PythonPaths) {
                    throw "[WARN] Python is not installed or not on PATH. Did you mean to run '-dontVersion'?"
                }

                $python = $PythonPaths[0]
            }

            Push-Location .\Setup
            Write-Host "[LOG] Setting version: $Version" -ForegroundColor Green
            & $python set_version_to.py -v $Version -t $Version
            Pop-Location
        }
        
        Push-Location $PSScriptRoot\..\
        Write-Host "[LOG] Performing a build" -ForegroundColor Green

        $binLog = if ($binaryLog) { "/bl:" + (Join-Path ".\" "build.binlog") } else { "" }
        $target = if ($rebuild -eq $true) { "Rebuild" } else { "Build" }

        Write-Host "[LOG] ...building native" -ForegroundColor Green
        & .\Setup\BuildGitExtNative.cmd $Configuration $target
        if ($LastExitCode -ne 0) {
            Write-Host "[ERROR] Build failed..." -ForegroundColor Red
            return -1
        }
        
        Write-Host "[LOG] ...building the solution" -ForegroundColor Green
        & .\Setup\hMSBuild -notamd64 -no-cache -m $Solution /p:Configuration=$Configuration /t:$target /nologo /v:$verbosity $binLog
        if ($LastExitCode -ne 0) {
            Write-Host "[ERROR] Build failed..." -ForegroundColor Red

            if ($env:APPVEYOR) {
                Get-ChildItem *.binlog -Recurse | % { Push-AppveyorArtifact $_.FullName -FileName $_.Name }
            }

            return -2
        }
    }

    if ($loc -eq $true) {
        Write-Host "[LOG] Updating translations" -ForegroundColor Green
        & .\Build\transifex\UpdateLocalEnglishTranslations.ps1 -TfmConfiguration $TfmConfiguration
    }

    if ($test -eq $true) {
        Write-Host "[LOG] Running tests" -ForegroundColor Green
        & .\Build\Run-Tests.ps1
        if ($LastExitCode -ne 0) {
            Write-Host "[ERROR] Tests failed..." -ForegroundColor Red
            return -3
        }
    }

    if ($pack -eq $true) {
        if ([string]::IsNullOrWhiteSpace($Version)) {
            throw "Version is required"
        }

        & .\Build\Prepare-Artifacts.ps1 -Configuration $Configuration -Version $Version -verbosity $verbosity -rebuild:$rebuild -binaryLog:$binaryLog
    }
}
catch {
    Write-Host $_.Exception -ForegroundColor Red
    return -1
}
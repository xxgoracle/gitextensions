[CmdletBinding()]
Param(
    [string] $Configuration,
    [string] $Version,
    [string][Alias('v')]$verbosity = "minimal",
    [switch] $rebuild,
    [switch][Alias('bl')]$binaryLog,
    [Parameter(ValueFromRemainingArguments=$true)][String[]]$properties
    )

$TfmConfiguration = "$Configuration\net461";

# -------------------------------
# debugging
# -------------------------------
if ($env:ARTIFACT_DEBUG_ENABLED -eq $true) {
    Write-Host "[INFO]: GitStatus.txt is to help find dirty status.  File should say repo and submodules are clean."
    Write-Host "[INFO]: Update the skip-worktree section in this script to fix CI builds."
    & git status > GitStatus.txt
    & git submodule foreach --recursive git status >> GitStatus.txt
    Push-AppveyorArtifact .\GitStatus.txt
    & tree /F /A > tree.txt
    Push-AppveyorArtifact .\tree.txt
}

# ----------------------------------------------------------------------
# download PluginManager
# ----------------------------------------------------------------------
Push-Location $PSScriptRoot
& .\Download-PluginManager.ps1 -ExtractRootPath '..\Plugins\GitExtensions.PluginManager'
Pop-Location

# -------------------------------
# build artifacts
# -------------------------------
$target = if ($rebuild -eq $true) { "Rebuild" } else { "Build" }
$bl = if ($binaryLog) { "/bl:" + (Join-Path ".\" "setup.binlog") } else { "" }
$MsiPath = "GitExtensions-$Version.msi";

# HACK: for some reason when we build the full solution the VSIX contains too many files, clean and rebuild the VSIX
if (Test-Path .\GitExtensionsVSIX\bin\Release) {
    Remove-Item -Path .\GitExtensionsVSIX\bin\Release -Recurse -Force
}

try {
    Push-Location .\GitExtensionsVSIX
    & ..\Setup\hMSBuild -notamd64 /t:$target /p:Configuration=$Configuration /nologo /v:m
    if ($LastExitCode -ne 0) { 
        Write-Host "[ERROR] VSIX rebuild failed..." -ForegroundColor Red
        return -5
    }
}
finally {
    Pop-Location
}

Write-Host "[LOG] ...creating installers for Git Extensions $Version" -ForegroundColor Green
if (Test-Path $MsiPath) {
    Remove-Item -Path $MsiPath -Out-Null
}

try {
    Push-Location .\Setup
    & .\hMSBuild Setup.wixproj /t:$target /p:Version=$Version /p:NumericVersion=$Version /p:Configuration=$Configuration /nologo /v:m /v:$verbosity $bl
    if ($LastExitCode -ne 0) { 
        Write-Host "[ERROR] Build failed..." -ForegroundColor Red

        if ($env:APPVEYOR) {
            Get-ChildItem *.binlog -Recurse | % { Push-AppveyorArtifact $_.FullName -FileName $_.Name }
        }

        return -6
    }

    Copy-Item "bin\$Configuration\GitExtensions.msi" ..\$MsiPath
    if ($LastExitCode -ne 0) { 
        Write-Host "[ERROR] VSIX rebuild failed..." -ForegroundColor Red
        return -7
    }
}
finally {
    Pop-Location
}

& $PSScriptRoot\Set-Portable.ps1 -TfmConfiguration $TfmConfiguration -IsPortable
if ($LastExitCode -ne 0) { throw; }

& Setup\MakePortableArchive.cmd $Configuration $TfmConfiguration $Version
if ($LastExitCode -ne 0) { throw; }

& $PSScriptRoot\Set-Portable.ps1 -TfmConfiguration $TfmConfiguration
if ($LastExitCode -ne 0) { throw; }

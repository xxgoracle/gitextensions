[CmdletBinding()]
Param(
    [Parameter(Mandatory=$true, Position=1)]
    [string] $TfmConfiguration
)

Push-Location $PSScriptRoot
try {
    $translationsFolder = Resolve-Path "$PSScriptRoot\..\..\GitUI\Translation";
    $releaseTranslationsFolder = Resolve-Path ..\..\GitExtensions\bin\$TfmConfiguration\Translation
    Write-Host "[LOG] ...copying '$translationsFolder\English*.xlf' to '$releaseTranslationsFolder'" -ForegroundColor Green
    xcopy "$translationsFolder\English*.xlf" "$releaseTranslationsFolder" /Y

    $src = Split-Path -Path $releaseTranslationsFolder -Parent
    Push-Location "$src"
    try {
        Write-Host "[LOG] ...updating the English resources" -ForegroundColor Green
        Start-Process -FilePath "$src\TranslationApp.exe" -ArgumentList "update" -Wait
        if ($LASTEXITCODE -ne 0) {
            Write-Host "[ERROR] Failed to update English translations..." -ForegroundColor Red
            exit -1
        }
    }
    finally {
        Pop-Location
    }

    Write-Host "[LOG] ...copying '$releaseTranslationsFolder\English*.xlf' to '$translationsFolder'" -ForegroundColor Green
    xcopy "$releaseTranslationsFolder\English*.xlf" "$translationsFolder"  /Y
}
finally {
    Pop-Location
}

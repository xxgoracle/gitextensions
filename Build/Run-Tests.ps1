$testAssemblies = (Get-ChildItem -Path UnitTests -Filter '*Tests.dll' -Recurse -Exclude 'ApprovalTests.dll').FullName | Where-Object { $_.Contains('\bin\Release') }
$packageConfig = [xml](Get-Content .nuget\packages.config)

$nunit3Console_version = $packageConfig.SelectSingleNode('/packages/package[@id="NUnit.ConsoleRunner"]').version
$nunit3Console = "packages\NUnit.ConsoleRunner.$nunit3Console_version\tools\nunit3-console.exe"

$opencover_version = $packageConfig.SelectSingleNode('/packages/package[@id="OpenCover"]').version
$opencover_console = "packages\OpenCover.$opencover_version\tools\OpenCover.Console.exe"

function Start-Tests {
    try {
        & $opencover_console `
            -register:user `
            -returntargetcode:1000 `
            -hideskipped:All `
            -filter:"+[*]* -[FluentAssertions*]* -[SmartFormat*]* -[nunit*]*" `
            -excludebyattribute:*.ExcludeFromCodeCoverage* `
            -excludebyfile:*\*Designer.cs `
            -output:"OpenCover.GitExtensions.xml" `
            -target:"$nunit3Console" `
            -targetargs:"$testAssemblies --timeout=90000" | Out-Host

        $testExitCode = $LASTEXITCODE

        if ($env:APPVEYOR) {
            Write-Host "[DEBUG] ...uploading test coverage results"

            $codecov_version = $packageConfig.SelectSingleNode('/packages/package[@id="Codecov"]').version
            $codecov = "packages\Codecov.$codecov_version\tools\codecov.exe"
            &$codecov -f ".\OpenCover.GitExtensions.xml" --flag production
            &$codecov -f ".\OpenCover.GitExtensions.xml" --flag tests
        }

        if ($testExitCode -ne 0) {
            Write-Host "[DEBUG] ...tests failed with exit code: $testExitCode"
            return $testExitCode;
        }
    }
    catch {
        Write-Host "[DEBUG] ...tests failed with exception:" -ForegroundColor Red
        Write-Host $_.Exception -ForegroundColor Red
        return -11;
    }

    return 0;
}

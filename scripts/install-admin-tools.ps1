[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"
$principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    throw "Run this script from an elevated PowerShell session."
}

$logDirectory = Join-Path $env:LOCALAPPDATA "DevSecOpsSetup"
New-Item -ItemType Directory -Force -Path $logDirectory | Out-Null
Start-Transcript -Path (Join-Path $logDirectory "admin-install.log") -Append

function Enable-WindowsFeature {
    param([string]$FeatureName)

    & dism.exe /Online /Enable-Feature "/FeatureName:$FeatureName" /All /NoRestart
    if ($LASTEXITCODE -notin @(0, 3010)) {
        throw "Failed to enable $FeatureName with exit code $LASTEXITCODE"
    }
}

Enable-WindowsFeature -FeatureName "Microsoft-Windows-Subsystem-Linux"
Enable-WindowsFeature -FeatureName "VirtualMachinePlatform"

winget install --id Docker.DockerDesktop --exact --source winget --silent --accept-package-agreements --accept-source-agreements --disable-interactivity
if ($LASTEXITCODE -ne 0) {
    throw "Docker Desktop installation failed with exit code $LASTEXITCODE"
}

wsl.exe --install --distribution Ubuntu --no-launch --web-download
if ($LASTEXITCODE -ne 0) {
    Write-Warning "Ubuntu installation returned exit code $LASTEXITCODE. Restart Windows and run this script again."
}

Stop-Transcript
Write-Output "Administrator-level installation finished. Restart Windows if requested."

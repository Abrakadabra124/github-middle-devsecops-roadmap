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

winget install --id Microsoft.WSL --exact --source winget --silent --accept-package-agreements --accept-source-agreements --disable-interactivity
if ($LASTEXITCODE -ne 0) {
    throw "Microsoft WSL package installation failed with exit code $LASTEXITCODE"
}

winget install --id Docker.DockerDesktop --exact --source winget --silent --accept-package-agreements --accept-source-agreements --disable-interactivity
if ($LASTEXITCODE -ne 0) {
    throw "Docker Desktop installation failed with exit code $LASTEXITCODE"
}

wsl.exe --install --distribution Ubuntu --no-launch --web-download
if ($LASTEXITCODE -ne 0) {
    throw "Ubuntu installation failed with exit code $LASTEXITCODE"
}

Stop-Transcript
Write-Output "Administrator-level installation finished. Restart Windows if requested."


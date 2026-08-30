[CmdletBinding()]
param(
    [string]$HelmVersion = "4.2.4",
    [string]$TerraformVersion = "1.15.8",
    [string]$TaskVersion = "3.53.1"
)

$ErrorActionPreference = "Stop"
$installRoot = Join-Path $env:LOCALAPPDATA "Programs\DevSecOpsTools"
$binDirectory = Join-Path $installRoot "bin"
$downloadDirectory = Join-Path $installRoot "downloads"

New-Item -ItemType Directory -Force -Path $binDirectory, $downloadDirectory | Out-Null

function Get-VerifiedArchive {
    param(
        [string]$Name,
        [string]$ArchiveUrl,
        [string]$ChecksumUrl,
        [string]$ChecksumPattern,
        [string]$ArchiveName
    )

    $archivePath = Join-Path $downloadDirectory $ArchiveName
    $checksumPath = Join-Path $downloadDirectory "$Name-checksums.txt"

    & curl.exe -fsSL --retry 3 --retry-delay 2 --output $checksumPath $ChecksumUrl
    if ($LASTEXITCODE -ne 0) {
        throw "Failed to download checksums for $Name"
    }

    $archiveIsValid = $false
    if (Test-Path $archivePath) {
        $existingChecksum = (Get-FileHash -Algorithm SHA256 $archivePath).Hash.ToLowerInvariant()
        $checksumLine = Select-String -Path $checksumPath -Pattern $ChecksumPattern | Select-Object -First 1
        $expectedChecksum = ($checksumLine.Line -split "\s+")[0].ToLowerInvariant()
        $archiveIsValid = $existingChecksum -eq $expectedChecksum
    }

    if (-not $archiveIsValid) {
        & curl.exe -fL --progress-bar --continue-at - --retry 5 --retry-all-errors --retry-delay 2 --output $archivePath $ArchiveUrl
        if ($LASTEXITCODE -ne 0) {
            throw "Failed to download $Name"
        }
    }

    $checksumLine = Select-String -Path $checksumPath -Pattern $ChecksumPattern | Select-Object -First 1
    if (-not $checksumLine) {
        throw "Checksum entry was not found for $Name"
    }

    $expectedChecksum = ($checksumLine.Line -split "\s+")[0].ToLowerInvariant()
    $actualChecksum = (Get-FileHash -Algorithm SHA256 $archivePath).Hash.ToLowerInvariant()
    if ($actualChecksum -ne $expectedChecksum) {
        throw "Checksum mismatch for $Name"
    }

    return $archivePath
}

function Install-ArchiveExecutable {
    param(
        [string]$Name,
        [string]$ArchivePath,
        [string]$RelativeExecutablePath,
        [string]$TargetExecutableName
    )

    $extractDirectory = Join-Path $downloadDirectory "$Name-extracted"
    Expand-Archive -Path $ArchivePath -DestinationPath $extractDirectory
    Copy-Item -Force (Join-Path $extractDirectory $RelativeExecutablePath) (Join-Path $binDirectory $TargetExecutableName)
}

$helmArchiveName = "helm-v$HelmVersion-windows-amd64.zip"
$helmArchive = Get-VerifiedArchive `
    -Name "helm" `
    -ArchiveUrl "https://get.helm.sh/$helmArchiveName" `
    -ChecksumUrl "https://get.helm.sh/$helmArchiveName.sha256sum" `
    -ChecksumPattern ([regex]::Escape($helmArchiveName)) `
    -ArchiveName $helmArchiveName
Install-ArchiveExecutable -Name "helm" -ArchivePath $helmArchive -RelativeExecutablePath "windows-amd64\helm.exe" -TargetExecutableName "helm.exe"

$terraformArchiveName = "terraform_${TerraformVersion}_windows_amd64.zip"
$terraformArchive = Get-VerifiedArchive `
    -Name "terraform" `
    -ArchiveUrl "https://releases.hashicorp.com/terraform/$TerraformVersion/$terraformArchiveName" `
    -ChecksumUrl "https://releases.hashicorp.com/terraform/$TerraformVersion/terraform_${TerraformVersion}_SHA256SUMS" `
    -ChecksumPattern ([regex]::Escape($terraformArchiveName)) `
    -ArchiveName $terraformArchiveName
Install-ArchiveExecutable -Name "terraform" -ArchivePath $terraformArchive -RelativeExecutablePath "terraform.exe" -TargetExecutableName "terraform.exe"

$taskArchiveName = "task_windows_amd64.zip"
$taskArchive = Get-VerifiedArchive `
    -Name "task" `
    -ArchiveUrl "https://github.com/go-task/task/releases/download/v$TaskVersion/$taskArchiveName" `
    -ChecksumUrl "https://github.com/go-task/task/releases/download/v$TaskVersion/task_checksums.txt" `
    -ChecksumPattern ([regex]::Escape($taskArchiveName)) `
    -ArchiveName $taskArchiveName
Install-ArchiveExecutable -Name "task" -ArchivePath $taskArchive -RelativeExecutablePath "task.exe" -TargetExecutableName "task.exe"

$userPath = [Environment]::GetEnvironmentVariable("Path", "User")
$userPathEntries = @($userPath -split ";" | Where-Object { $_ })
if ($userPathEntries -notcontains $binDirectory) {
    $newUserPath = ($userPathEntries + $binDirectory) -join ";"
    [Environment]::SetEnvironmentVariable("Path", $newUserPath, "User")
}

$env:Path = "$binDirectory;$env:Path"

& (Join-Path $binDirectory "helm.exe") version --short
& (Join-Path $binDirectory "terraform.exe") version
& (Join-Path $binDirectory "task.exe") --version

Write-Output "Installed tools into $binDirectory"
Write-Output "Open a new terminal to use the updated user PATH."

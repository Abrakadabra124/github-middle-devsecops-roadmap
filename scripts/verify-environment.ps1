[CmdletBinding()]
param()

$tools = @(
    @{ Name = "git"; Arguments = @("--version") },
    @{ Name = "gh"; Arguments = @("--version") },
    @{ Name = "docker"; Arguments = @("--version") },
    @{ Name = "kubectl"; Arguments = @("version", "--client") },
    @{ Name = "kind"; Arguments = @("version") },
    @{ Name = "helm"; Arguments = @("version", "--short") },
    @{ Name = "terraform"; Arguments = @("version") },
    @{ Name = "task"; Arguments = @("--version") },
    @{ Name = "java"; Arguments = @("-version") }
)

$missingTools = @()
foreach ($tool in $tools) {
    $command = Get-Command $tool.Name -ErrorAction SilentlyContinue
    if (-not $command) {
        $missingTools += $tool.Name
        Write-Output "MISSING $($tool.Name)"
        continue
    }

    Write-Output "PRESENT $($tool.Name)"
    & $command.Source @($tool.Arguments) 2>&1 | Select-Object -First 3
}

Write-Output "GITHUB AUTH"
gh auth status

Write-Output "DOCKER DAEMON"
docker info --format "{{.ServerVersion}}" 2>&1

Write-Output "WSL DISTRIBUTIONS"
$wslRows = @(& wsl.exe --list --verbose 2>&1) -replace "`0", ""
$wslRows

$installedDistributions = @(& wsl.exe --list --quiet 2>&1) -replace "`0", ""
if ($installedDistributions -contains "Ubuntu") {
    Write-Output "UBUNTU TOOLCHAIN"
    foreach ($linuxTool in @("ansible", "ansible-lint", "mvn", "python3", "shellcheck")) {
        & wsl.exe -d Ubuntu -- which $linuxTool 2>&1 | Out-Null
        if ($LASTEXITCODE -ne 0) {
            Write-Output "MISSING $linuxTool"
            continue
        }

        Write-Output "PRESENT $linuxTool"
        & wsl.exe -d Ubuntu -- $linuxTool --version 2>&1 | Select-Object -First 3
    }
} else {
    Write-Output "MISSING Ubuntu"
}

if ($missingTools.Count -gt 0) {
    throw "Missing tools: $($missingTools -join ', ')"
}

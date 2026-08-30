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
wsl.exe --list --verbose 2>&1

if ($missingTools.Count -gt 0) {
    throw "Missing tools: $($missingTools -join ', ')"
}

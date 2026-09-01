# Week 1 Completion Audit

Audit date: 2026-09-01.

- Git, GitHub CLI, Docker, kubectl, kind, Helm, Terraform, Task and Java are present on Windows.
- Ansible, ansible-lint, Maven, Python and ShellCheck are present in Ubuntu.
- WSL `2.7.12.0` uses kernel `6.18.33.2`; Ubuntu and all three lab distributions run as WSL2.
- Docker Desktop `4.88.1` exposes daemon `29.7.2` and runs the downloaded `kindest/node:v1.37.0` image.
- `devsecops-smoke` was created, reached Kubernetes `v1.37.0` Ready state and was deleted; no kind clusters remained.
- The Linux control and target nodes run with UIDs `1100`, `1101` and `1102`, active systemd and SSH sockets.
- Repository governance, CI, Conventional Commits and branch-protection policy are now explicit and testable.

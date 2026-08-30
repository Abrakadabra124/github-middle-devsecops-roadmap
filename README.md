# GitHub Middle DevSecOps Roadmap

Практический план на 24 недели для GitHub-портфолио уровня **Middle DevSecOps** с ориентацией на требования HR и технических интервьюеров SberTech/Sber.

Период плана: **31 августа 2026 — 14 февраля 2027**. Базовая нагрузка: **12–15 часов в неделю**.

## Что будет в портфолио

| Репозиторий | Что доказывает |
|---|---|
| `linux-secure-baseline` | Linux, сети, systemd, hardening, Ansible |
| `secure-ci-cd` | CI/CD, Docker, SAST/SCA, secrets, SBOM, signing |
| `kubernetes-platform-lab` | Kubernetes, Helm, RBAC, NetworkPolicy, Pod Security |
| `terraform-infrastructure` | Terraform, state, cloud networking, policy as code |
| `observability-sre-lab` | Prometheus, Grafana, Loki, OpenTelemetry, SLI/SLO |
| `enterprise-devsecops-platform` | Java, PostgreSQL, Kafka, GitOps, Vault, DR |

Именно эти шесть проектов стоит закрепить в профиле GitHub.

## Документы

- [Анализ требований HR и технического интервьюера](docs/sbertech-requirements-analysis.md)
- [План по неделям](docs/24-week-roadmap.md)
- [Архитектура GitHub-портфолио](docs/portfolio-architecture.md)
- [Шаблон README проекта](templates/PROJECT_README_TEMPLATE.md)
- [Чек-лист готовности к интервью](templates/INTERVIEW_SCORECARD.md)

## Быстрый старт окружения

Обычный PowerShell без прав администратора:

```powershell
.\scripts\install-user-tools.ps1
```

PowerShell с правами администратора:

```powershell
.\scripts\install-admin-tools.ps1
```

После первого запуска Ubuntu в WSL:

```bash
bash /mnt/c/Users/Abrakadabra124/Documents/ChatGPT/Github\ middle\ devsecops/scripts/bootstrap-ubuntu.sh
```

Проверка Windows-части окружения:

```powershell
.\scripts\verify-environment.ps1
```

## Принцип выполнения

Каждую неделю нужно оставлять проверяемый результат: рабочий код, CI-проверку, архитектурное решение, сценарий отказа и обновлённую документацию.

Проект считается готовым, когда автор способен объяснить архитектуру и альтернативы, воспроизвести окружение одной командой, показать security controls, диагностировать подготовленные отказы, назвать SLI/SLO и провести десятиминутное техническое демо.

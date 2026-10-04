# DevSecOps: безопасная поставка с проверяемыми результатами

С 2026-10-04 основной проект строится от конечного результата, исследования официальных практик и измеримой приёмки. Формулировки «уровень Middle/Senior» не являются критериями качества кода. Старый 24-недельный план сохранён как история обучения, а не актуальный контракт реализации.

Текущая цель: воспроизводимая Secure Delivery Platform, которая блокирует небезопасные изменения, развёртывает доверенные артефакты, изолирует команды и позволяет проверить наблюдаемость, откат и восстановление.

Основной проект: [Secure Delivery Platform](https://github.com/Abrakadabra124/enterprise-devsecops-platform). Канонические документы: [цель](https://github.com/Abrakadabra124/enterprise-devsecops-platform/blob/main/GOAL.md), [критерии Q01-Q10](https://github.com/Abrakadabra124/enterprise-devsecops-platform/blob/main/CONSTRAINTS.md), [исследование](https://github.com/Abrakadabra124/enterprise-devsecops-platform/blob/main/docs/research/best-practices.md), [план](https://github.com/Abrakadabra124/enterprise-devsecops-platform/blob/main/tasks/plan.md).

Порядок: цель -> исследование и baseline -> план с результатами/метриками -> выполнение через режим цели -> повторная проверка. Не считать работающий локальный стенд доказательством production HA, соответствия стандарту целиком или профессионального грейда.

Полная локальная приёмка Q01-Q10 прошла 2026-10-04: signed Flux/SOPS delivery, admission/network denial, нагрузка, rollback и независимое восстановление PostgreSQL. [Публичная сводка](https://github.com/Abrakadabra124/enterprise-devsecops-platform/blob/main/docs/evidence/acceptance-2026-10-04.json), [архитектура](https://github.com/Abrakadabra124/enterprise-devsecops-platform/blob/main/docs/architecture.md), [запуск и приёмка](https://github.com/Abrakadabra124/enterprise-devsecops-platform/blob/main/docs/runbooks/local-platform.md). Метрики относятся к конкретному проверенному снимку, а не автоматически к любому следующему commit. Raw evidence и credentials не публикуются.

## Исторический план

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
- [Стандарт репозитория и branch protection](docs/repository-standard.md)
- [Аудит завершения недели 1](docs/week1-completion-audit.md)

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

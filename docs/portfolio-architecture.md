# Архитектура GitHub-портфолио

## Путь HR: 90 секунд

Профиль должен сразу отвечать на пять вопросов:

1. Кто кандидат: Middle DevSecOps / Platform Engineer.
2. С чем работает: Linux, Kubernetes, CI/CD, Terraform, Ansible, observability, security.
3. Какие системы построил: шесть pinned repositories.
4. Как думает о production: SLO, security gates, runbooks, incidents, backup/restore.
5. Как связаться: выбранный владельцем профиля публичный контакт.

## Путь технического проверяющего: 15 минут

В первых двух экранах README каждого проекта:

- инженерная проблема и границы;
- архитектурная диаграмма;
- одна команда быстрого старта;
- CI/security badges;
- решения и компромиссы;
- ссылки на demo, runbook и failure scenarios;
- измеримый результат.

Проверяющий должен быстро найти pipeline, Terraform/Ansible modules, Helm chart, security policies, tests, ADR, threat model и postmortem.

## Шесть закреплённых репозиториев

### `enterprise-devsecops-platform`

Главный проект: Java, PostgreSQL, Kafka, Kubernetes, GitOps, Vault, observability, security gates, backup/restore и game day.

### `secure-ci-cd`

Pipeline как продукт: tests, SAST, SCA, secrets, container scan, SBOM, signing, release и rollback.

### `kubernetes-platform-lab`

Helm, RBAC, NetworkPolicy, Pod Security, resources, probes, HPA/PDB и debugging scenarios.

### `terraform-infrastructure`

Модули, environments, remote state, cloud/local networking, Ansible integration, drift и policy checks.

### `observability-sre-lab`

Metrics/logs/traces, SLI/SLO, error budget, alerting, load test и postmortem.

### `linux-secure-baseline`

Linux hardening, systemd, networking, Ansible, idempotency и fault injection.

## Стандарт структуры

```text
.
├── .github/
│   ├── workflows/
│   ├── ISSUE_TEMPLATE/
│   └── PULL_REQUEST_TEMPLATE.md
├── docs/
│   ├── architecture.md
│   ├── threat-model.md
│   ├── adr/
│   ├── runbooks/
│   └── postmortems/
├── src/ или infrastructure/
├── tests/
├── scripts/
├── Makefile или Taskfile.yml
├── CONTRIBUTING.md
├── SECURITY.md
├── CHANGELOG.md
├── LICENSE
└── README.md
```

## Обязательные сигналы качества

- Репозиторий запускается с нуля по документированной команде.
- Default branch защищена, изменения проходят pull request.
- Workflows используют минимальные permissions и закреплённые версии actions.
- Dependencies обновляются автоматически, но merge не происходит без checks.
- Нет секретов; test fixtures безопасны и явно помечены.
- Releases имеют changelog и immutable artifacts.
- Диаграммы хранятся как Mermaid/PlantUML source.
- Ошибки и ограничения перечислены честно.

## Каркас profile README

```markdown
# Имя — Middle DevSecOps / Platform Engineer

Строю воспроизводимые и безопасные delivery-платформы: Linux, Kubernetes,
Terraform, Ansible, CI/CD, observability и application security.

## Featured work
- Enterprise DevSecOps Platform — GitOps, Vault, PostgreSQL, Kafka, SLO/DR
- Secure CI/CD — SAST, SCA, SBOM, signing, policy gates
- Kubernetes Platform Lab — RBAC, NetworkPolicy, Pod Security, HPA/PDB

## Current focus
- Production troubleshooting
- Secure software supply chain
- OpenShift-compatible workload design

## Contact
- Email: ...
```

## История активности

Не создавать искусственные ежедневные коммиты. Лучше 3–5 содержательных изменений в неделю: issue, pull request, review, исправление после CI и release/documentation update.

До готовности не закреплять пустой репозиторий. После каждого `v1.0.0` обновлять pins. Финальный порядок: capstone, secure CI/CD, Kubernetes, Terraform, observability, Linux.

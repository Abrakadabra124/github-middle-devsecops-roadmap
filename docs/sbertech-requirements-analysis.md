# Анализ требований SberTech: HR и техническая проверка

## Основание анализа

План составлен 30 августа 2026 года по открытым требованиям SberTech/Sber и связанным DevOps-вакансиям. Официальная вакансия DevSecOps Сбера выделяет безопасный CI/CD, Kubernetes/OpenShift, Jenkins, GitLab CI, Nexus, Ansible, Vault, Istio, SAST/DAST, анализ зависимостей, контейнеров и секретов. Вакансии SberTech дополнительно подтверждают Linux, TCP/IP, PostgreSQL, Docker, Kubernetes, Python/Bash, Ansible/Terraform, Grafana/Prometheus и эксплуатацию высоконагруженных систем.

Это не внутренний список вопросов конкретного интервьюера, а практическая модель ожидаемого уровня, выведенная из публичных задач и требований.

## Как смотрит HR

| Сигнал | Что должно быть видно на GitHub | Красный флаг |
|---|---|---|
| Позиционирование | `Middle DevSecOps / Platform Engineer`, стек и специализация | Профиль без описания или «изучаю всё» |
| Релевантность | Шесть проектов по Linux, CI/CD, Kubernetes, IaC, observability, security | Десятки форков и hello-world |
| Завершённость | Releases, версии, roadmap, закрытые milestones | Все репозитории «WIP» |
| Ответственность | Runbook, postmortem, SLO, rollback, backup/restore | Только happy path |
| Коммуникация | Структурный README, схемы, ADR, русский текст и English summary | Код без объяснений |
| Стабильность | Регулярная история изменений 4–6 месяцев | Один массовый upload |
| Командная зрелость | Issues, pull requests, review checklist, contribution guide | Изменения только напрямую в `main` |
| Результат | Deploy/recovery time, coverage, scan gates, latency | Список технологий без результата |

### Формулировки для резюме

- построил воспроизводимую Kubernetes-платформу с RBAC, NetworkPolicy, Pod Security и GitOps;
- внедрил pipeline с SAST, SCA, secret scanning, SBOM и проверкой подписанного контейнера;
- определил SLO и alerting, провёл game day и оформил postmortem;
- автоматизировал инфраструктуру Terraform и Ansible с безопасным хранением state и policy checks.

## Как смотрит технический интервьюер

| Компетенция | Ожидаемый уровень Middle | Доказательство |
|---|---|---|
| Linux | процессы, systemd, права, FS, limits, namespaces/cgroups, logs, hardening | Linux-проект и fault scenarios |
| Сети | TCP/IP, DNS, TLS, routing, NAT, L4/L7, packet flow | сетевые лабораторные и runbook |
| Git | branches, PR, rebase/merge, tags, releases, protected branches | история репозиториев |
| Скриптинг | Bash/Python, обработка ошибок, тесты | CLI-утилиты и CI |
| Контейнеры | multi-stage, non-root, capabilities, layers, registry, limits | secure CI/CD |
| CI/CD | stages, artifacts, cache, approvals, rollback, immutable delivery | pipeline и release flow |
| DevSecOps | threat model, secrets, SAST/SCA/DAST, image/IaC scan, SBOM, signing | security gates |
| Kubernetes | workloads, probes, resources, ingress, RBAC, NetworkPolicy, HPA/PDB, debug | platform lab |
| OpenShift readiness | SCC/non-root, routes/operators, enterprise governance | compatibility section |
| IaC | modules/state/import/plan, roles/idempotency, drift, secrets | Terraform/Ansible project |
| Данные | PostgreSQL backup/restore, migrations; Kafka consumer groups и delivery semantics | итоговый проект |
| Observability | metrics/logs/traces, RED/USE, SLI/SLO, actionable alerts | SRE lab |
| Надёжность | capacity, retries/timeouts, degradation, rollback, DR, postmortem | game day |
| Troubleshooting | гипотезы, послойная проверка, минимизация blast radius | failure scenarios |

## Вопросы, к которым должны готовить проекты

1. Что происходит от `git push` до запуска контейнера в production?
2. Где ставить SAST, SCA, DAST, image scan и policy checks и почему?
3. Чем отличаются readiness, liveness и startup probes?
4. Почему возникает `OOMKilled`, если на узле есть свободная память?
5. Как расследовать `502`, DNS timeout, TLS error и потерю пакетов?
6. Как безопасно хранить Terraform state и секреты?
7. Как доказать идемпотентность Ansible role?
8. Когда нужны HPA, PDB, topology spread или anti-affinity?
9. Как определить SLO и избежать шумных алертов?
10. Как восстановить PostgreSQL и доказать RPO/RTO?
11. Какие гарантии доставки даёт Kafka и где появляется дублирование?
12. Зачем нужны подпись образа, SBOM и provenance?
13. Какой blast radius у изменения и как выполнить rollback?
14. Чем GitOps отличается от `kubectl apply` из CI?
15. Как изменить решение для OpenShift и закрытого enterprise-контура?

## Приоритеты

### Обязательно

- Linux, сети и troubleshooting.
- Docker и безопасная сборка образов.
- CI/CD и Git workflow.
- Kubernetes, Helm, RBAC, NetworkPolicy, resources и probes.
- Ansible и Terraform.
- Prometheus/Grafana и эксплуатационные метрики.
- SAST, SCA, secret scanning, image/IaC scanning.
- PostgreSQL на уровне эксплуатации.

### Сильное преимущество

- GitOps через Argo CD.
- Vault и управление секретами.
- Istio или понимание service mesh.
- Kafka и event-driven контур.
- OpenTelemetry, traces и correlation IDs.
- SBOM, подпись образов и attestations.
- Policy as code через Kyverno или OPA Gatekeeper.

### Не тратить основной фокус

- сертификаты без проектов;
- сложный frontend итогового приложения;
- несколько поверхностных CI-инструментов вместо одного глубокого pipeline;
- облачные расходы ради скриншота;
- искусственные contributions без содержательных изменений.

## Публичные источники

- [DevSecOps, Центр кибербезопасности — Сбер](https://developers.sber.ru/kak-v-sbere/vacancies/devsecops_cc)
- [One Day Offer DevOps SberTech](https://sbertech.ru/one-day-offer-devops)
- [DevOps инженер Pangolin DB — SberTech](https://career.habr.com/vacancies/1000163489)
- [DevOps-инженер Platform V — SberTech](https://career.habr.com/vacancies/1000163917)
- [SberTech на Habr Career](https://career.habr.com/companies/sbertech/vacancies)

# Middle DevSecOps Interview Scorecard

Оценка: `0` — не могу объяснить; `1` — знаю термины; `2` — делал с подсказкой; `3` — реализовал и диагностировал; `4` — обосновываю компромиссы и могу научить другого.

## HR Screen

| Проверка | Цель | Оценка |
|---|---:|---:|
| Профессиональная история за 90 секунд | 4 |  |
| Роль, специализация и целевой стек | 4 |  |
| Вклад и результат каждого pinned проекта | 3 |  |
| Рассказ об ошибке или инциденте | 3 |  |
| Мотивация к enterprise DevSecOps | 3 |  |

## Technical Core

| Область | Цель | Оценка |
|---|---:|---:|
| Linux и systemd | 3 |  |
| TCP/IP, DNS и TLS | 3 |  |
| Git workflow | 3 |  |
| Bash/Python automation | 3 |  |
| Docker и container security | 3 |  |
| CI/CD architecture | 4 |  |
| SAST/SCA/DAST/secrets/SBOM | 3 |  |
| Kubernetes troubleshooting | 4 |  |
| RBAC/NetworkPolicy/Pod Security | 3 |  |
| Terraform state/modules/drift | 3 |  |
| Ansible idempotency | 3 |  |
| PostgreSQL operations | 3 |  |
| Kafka fundamentals | 2 |  |
| Prometheus/Grafana/alerting | 3 |  |
| SLI/SLO/error budget | 3 |  |
| Incident response/postmortem | 3 |  |

## Practical Verification

- [ ] С чистой машины поднять любой проект по README.
- [ ] За 10 минут локализовать подготовленный Kubernetes failure.
- [ ] Показать блокировку pipeline на security violation.
- [ ] Объяснить Terraform plan и blast radius.
- [ ] Восстановить PostgreSQL из backup и измерить время.
- [ ] Найти запрос по metrics, logs и trace.
- [ ] Провести rollback последнего release.
- [ ] Нарисовать архитектуру итогового проекта без подготовки.

## Готовность к откликам

- обязательные области в среднем не ниже `3`;
- нет `0` в Linux, сетях, CI/CD, Kubernetes и IaC;
- минимум четыре pinned проекта имеют `v1.0.0`;
- capstone имеет demo, threat model, runbook и postmortem;
- проведены два независимых mock-интервью.

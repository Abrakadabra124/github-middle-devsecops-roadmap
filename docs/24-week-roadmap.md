# План на 24 недели

## Режим работы

- Срок: **31.08.2026–14.02.2027**.
- Нагрузка: 12–15 часов в неделю.
- Ритм: 60% реализация, 20% тестирование и security, 10% документация, 10% устное объяснение.
- Каждая функция проходит через issue → branch → pull request → CI → merge → release note.
- Каждое воскресенье: пяти-семиминутная запись демо и обновление progress log.

## Фаза 1. Инженерная база и Linux

### Неделя 1 — 31.08.2026–06.09.2026

**Цель:** оформить профиль и стандарт будущих репозиториев.

- Создать profile README с позиционированием, стеком, текущим фокусом и контактами.
- Создать шесть репозиториев с milestones и issues, но закреплять только наполненные.
- Настроить шаблоны issue/PR, Conventional Commits, `CODEOWNERS`, branch protection model.
- Подготовить лабораторию: WSL2/Linux VM, Docker, `kind`/`k3d`, `kubectl`, Helm, Terraform, Ansible.
- Результат: публичная roadmap-доска и первый release planning-репозитория.

### Неделя 2 — 07.09.2026–13.09.2026

**Проект:** `linux-secure-baseline`.

- Поднять 2–3 Linux VM через Vagrant/libvirt или доступный локальный backend.
- Описать пользователей, SSH, sudo, firewall, time sync, packages и audit settings.
- Отработать `systemctl`, `journalctl`, permissions, signals, `/proc`, limits.
- Написать Bash/Python health-check с корректными exit codes.
- Результат: воспроизводимый стенд и схема потока подключения.

### Неделя 3 — 14.09.2026–20.09.2026

- Добавить лабораторные по DNS, TCP handshake, routing, NAT, TLS и reverse proxy.
- Использовать `ss`, `ip`, `dig`, `curl`, `openssl`, `tcpdump`, `traceroute`.
- Создать пять поломок: неверный DNS, закрытый порт, просроченный сертификат, permission denied, заполненный диск.
- Для каждой оформить runbook: симптомы → гипотезы → команды → root cause → prevention.

### Неделя 4 — 21.09.2026–27.09.2026

- Перенести hardening в Ansible roles.
- Добавить idempotency check, `ansible-lint`, Molecule/Testinfra или эквивалент.
- Ввести inventory для `dev` и `prod-like`, безопасные variables и vault-файл-пример без секретов.
- Выпустить `v1.0.0`, приложить до/после и ограничения hardening.
- Устно объяснить systemd, namespaces/cgroups, TCP/TLS и идемпотентность Ansible.

## Фаза 2. Secure CI/CD и контейнеры

### Неделя 5 — 28.09.2026–04.10.2026

**Проект:** `secure-ci-cd`.

- Создать небольшой Java/Spring Boot API с PostgreSQL и миграциями.
- Добавить unit/integration tests, structured logs, health endpoints.
- Написать multi-stage Dockerfile: non-root, минимальный base image, `.dockerignore`.
- Добавить локальный запуск через Compose.

### Неделя 6 — 05.10.2026–11.10.2026

- Построить CI: lint → test → build → package → container build → integration test.
- Настроить cache, artifacts, test reports и версионирование по Git tag.
- Реализовать pipeline в GitHub Actions и показать эквивалентный `Jenkinsfile` или `.gitlab-ci.yml`.
- Запретить публикацию при падении обязательной проверки.
- Измерить clean build и cached build.

### Неделя 7 — 12.10.2026–18.10.2026

- Добавить Gitleaks, Semgrep, dependency scanning, Trivy/Grype и IaC scan.
- Разделить blocking и non-blocking gates, описать threshold и false-positive process.
- Добавить безопасную уязвимую fixture/ветку для доказательства срабатывания защит.
- Создать threat model pipeline: source, runner, registry, artifact, credentials.

### Неделя 8 — 19.10.2026–25.10.2026

- Генерировать SBOM через Syft или эквивалент.
- Подписывать image/release artifact через Cosign и проверять подпись перед deploy.
- Добавить release notes, rollback-инструкцию и retention policy.
- Выпустить `v1.0.0`, записать демо «blocked build → fix → signed release».
- Объяснить границы SAST/SCA/DAST, secret scanning и supply-chain controls.

## Фаза 3. Kubernetes-платформа

### Неделя 9 — 26.10.2026–01.11.2026

**Проект:** `kubernetes-platform-lab`.

- Поднять multi-node `kind`/`k3d` cluster.
- Развернуть API через Deployment, Service, ConfigMap и Secret placeholder.
- Настроить requests/limits и startup/readiness/liveness probes.
- Добавить Makefile/Taskfile для полного lifecycle стенда.

### Неделя 10 — 02.11.2026–08.11.2026

- Упаковать приложение в Helm chart.
- Развести values для `dev`, `stage`, `prod-like`.
- Добавить Ingress, TLS для локального стенда и database dependency.
- Проверять chart через lint, schema и render tests.
- Описать release и rollback Helm.

### Неделя 11 — 09.11.2026–15.11.2026

- Настроить namespaces, ServiceAccounts и минимальный RBAC.
- Добавить default-deny NetworkPolicy и разрешить только необходимые потоки.
- Применить Pod Security: non-root, dropped capabilities, seccomp, read-only root filesystem где возможно.
- Добавить Kyverno/Gatekeeper policies и отрицательные тесты.
- Описать, что изменится в OpenShift/SCC.

### Неделя 12 — 16.11.2026–22.11.2026

- Добавить HPA, PDB, topology spread/anti-affinity и graceful termination.
- Подготовить `CrashLoopBackOff`, `ImagePullBackOff`, `Pending`, `OOMKilled`, DNS failure.
- Сделать cheat sheet диагностики: events, logs, exec, describe, resource pressure.
- Выпустить `v1.0.0` и провести десятиминутный live troubleshooting.

## Фаза 4. Infrastructure as Code

### Неделя 13 — 23.11.2026–29.11.2026

**Проект:** `terraform-infrastructure`.

- Спроектировать VPC/subnets/security groups/VM/bastion или бесплатный локальный аналог.
- Создать Terraform modules с typed variables, outputs и naming convention.
- Разделить environments без копирования модулей.
- Добавить architecture diagram и ADR выбора backend.

### Неделя 14 — 30.11.2026–06.12.2026

- Реализовать инфраструктуру в cloud sandbox с budget alerts либо полностью локально.
- Настроить remote state/locking, не коммитить state и credentials.
- Добавить output/inventory для Ansible.
- Проверить destroy/recreate и оценить стоимость.

### Неделя 15 — 07.12.2026–13.12.2026

- Связать Terraform и Ansible без смешения ответственности.
- Ansible настраивает ОС/runtime; Terraform управляет infrastructure resources.
- Добавить smoke tests и проверку идемпотентности.
- Продемонстрировать plan review, apply и rollback.

### Неделя 16 — 14.12.2026–20.12.2026

- Добавить `terraform fmt/validate`, TFLint, Checkov/tfsec и policy checks.
- Описать drift detection, import ресурса и восстановление state.
- Ввести pull-request plan с защитой от случайного apply.
- Выпустить `v1.0.0`; подготовить ответы про state, secrets, modules и blast radius.

## Фаза 5. Observability и SRE

### Неделя 17 — 21.12.2026–27.12.2026

**Проект:** `observability-sre-lab`.

- Развернуть Prometheus, Grafana, Loki и OpenTelemetry Collector.
- Инструментировать API метриками, логами и traces с correlation ID.
- Показать RED для сервиса и USE для инфраструктуры.
- Добиться, чтобы один запрос прослеживался через три сигнала.

### Неделя 18 — 28.12.2026–03.01.2027

- Создать dashboards для golden signals, JVM, PostgreSQL и Kubernetes.
- Настроить Alertmanager и тестовый receiver.
- Для каждого alert указать impact, threshold, runbook и owner.
- Удалить шумные алерты и доказать действие оставшихся.

### Неделя 19 — 04.01.2027–10.01.2027

- Определить SLI/SLO доступности и latency, рассчитать error budget.
- Добавить нагрузочное тестирование через k6/JMeter/Locust.
- Найти bottleneck, изменить ресурсы/конфигурацию и сравнить before/after.
- Оформить отчёт с измеримыми результатами.

### Неделя 20 — 11.01.2027–17.01.2027

- Провести game day: latency PostgreSQL, падение pod, нехватка CPU/memory, потеря зависимости.
- Зафиксировать timeline, detection, mitigation и recovery time.
- Написать blameless postmortem с action items.
- Выпустить `v1.0.0` и подготовить рассказ о расследовании инцидента.

## Фаза 6. Enterprise capstone

### Неделя 21 — 18.01.2027–24.01.2027

**Проект:** `enterprise-devsecops-platform`.

- Спроектировать сервис обработки событий: Java API, PostgreSQL, Kafka, worker.
- Создать C4 context/container diagrams, data-flow diagram и threat model STRIDE.
- Зафиксировать ADR: sync vs async, delivery semantics, secrets, deployment model.
- Определить SLO, RPO/RTO и failure domains.

### Неделя 22 — 25.01.2027–31.01.2027

- Подключить secure pipeline из второго проекта.
- Настроить Helm/Kustomize и GitOps через Argo CD.
- Реализовать promotion `dev → stage → prod-like` через pull request.
- Добавить canary/blue-green или обоснованно отказаться в ADR.

### Неделя 23 — 01.02.2027–07.02.2027

- Подключить Vault или External Secrets в безопасном локальном режиме.
- Добавить policy as code, image signature verification и namespace isolation.
- Реализовать PostgreSQL migrations/backup/restore и Kafka consumer group demo.
- Опционально добавить Istio: mTLS, traffic policy и observability — только с объяснимой пользой.

### Неделя 24 — 08.02.2027–14.02.2027

- Провести финальный game day и восстановление из backup.
- Проверить RPO/RTO, rollback, degraded mode и повторную обработку Kafka messages.
- Оформить production-readiness review, postmortem и roadmap v2.
- Выпустить `v1.0.0`, записать 10–15 минут демо и обновить profile README.
- Провести два mock-интервью: HR story на 90 секунд и технический разбор на 45–60 минут.

## Еженедельный Definition of Done

- `main` зелёный, обязательные checks включены.
- Нет реальных секретов, state, токенов и персональных данных.
- README содержит цель, архитектуру, запуск, security и troubleshooting.
- Есть минимум один тест поведения и один negative/security test.
- Есть issue и pull request, объясняющие изменение.
- Команды запуска проверены с чистого окружения.
- Новая тема проговорена вслух без чтения документации.

## Если времени меньше

При 6–8 часах в неделю растянуть план до 36 недель. Не сокращать Linux, Kubernetes, CI/CD, IaC и troubleshooting. Первыми убирать Istio, сложную DAST-инфраструктуру и реальный платный cloud.

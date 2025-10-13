# jk-museum-monitoring

Набор инструментов для мониторинга контейнеров jk-museum:
Prometheus + Grafana + Alertmanager + Loki + Promtail + cAdvisor + Node Exporter \
Разворачиваем мониторинг docker-контейнеров на prometheus + grafana с логами через loki и promtail и алертами в telegram.

## Как подключить к проекту
### 1) Настройте .env
```
TELEGRAM_BOT_TOKEN=771....
TELEGRAM_CHAT_ID=-100....
```
### 2) Запустите мониторинг
```
docker compose up -d
```

## Адреса сервисов
Prometheus - http://<ваш ip>:9090 \
Alertmanager - http://<ваш ip>:9093 \
Grafana - http://<ваш ip>:3001 \
Loki - http://<ваш ip>:3100 \
cAdvisor - http://<ваш ip>:8080 

## Метрики и логи
В Grafana: источники Prometheus и Loki уже подключены \
Метрики контейнеров: CPU, RAM, Disk, Network \
Логи backend: Explore -> Loki

## Уведомления
Все алерты (CPU>80%, RAM>95%) приходят в Telegram

## Настройка grafana

Источники данных провижнятся автоматически:
- Prometheus (uid: prometheus)
- Loki (uid: loki)

Дашборд лежит в проекте 'container-metrics.json'

## Остановка и очистка
```
docker compose down
docker volume rm $(docker volume ls -q | grep -E 'prometheus_data|grafana_data|loki_data|promtail_positions')
```

# Отчёт

**Что сделал**
- поднял prometheus, grafana, cadvisor, node-exporter, loki, promtail, alertmanager
- настроил сбор метрик docker и хоста, логирование и алерты

**Сложности и решения**
- переменные окружения, шаблон через `envsubst` в сервисе `amcfg`. из-за формата id чата не получалось прокинуть через .env((((
- promtail. добавлен доступ к `/var/lib/docker/containers` и `docker.sock`
- node-exporter → включен `network_mode: host` и `pid: host`


## Результаты
<img width="1919" height="867" alt="image" src="https://github.com/user-attachments/assets/56e1446c-712f-414b-9d37-8e300313f649" />
<img width="1914" height="858" alt="image" src="https://github.com/user-attachments/assets/df1cabb9-656c-4fe0-b3c6-1a2c8ac8efa6" />


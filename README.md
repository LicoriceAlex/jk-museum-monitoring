# jk-museum-monitoring

Набор инструментов для мониторинга контейнеров jk-museum:
Prometheus + Grafana + Alertmanager + Loki + Promtail + cAdvisor + Node Exporter

---

## Как подключить к проекту

### 1) Убедитесь, что в `docker-compose.yml` проекта контейнер `backend` имеет метки:
```
labels:
  logging: "promtail"
  logging_jobname: "backend"
```

### 2) Добавьте мониторинг в сеть основного проекта
```
networks:
  default:
    external: true
    name: myapp_default
```
### 3) Настройте .env
```
TELEGRAM_BOT_TOKEN=771....
TELEGRAM_CHAT_ID=-100....
```
### 4) Запусти мониторинг
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

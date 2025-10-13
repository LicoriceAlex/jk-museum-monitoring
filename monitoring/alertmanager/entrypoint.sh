#!/bin/sh
set -e
# генерим финальный конфиг из шаблона с подстановкой env
envsubst < /etc/alertmanager/alertmanager.tmpl.yml > /etc/alertmanager/alertmanager.yml
# запускаем alertmanager с нашим конфигом
exec /bin/alertmanager --config.file=/etc/alertmanager/alertmanager.yml
set -e
envsubst < /etc/alertmanager/alertmanager.tmpl.yml > /etc/alertmanager/alertmanager.yml
exec /bin/alertmanager --config.file=/etc/alertmanager/alertmanager.yml
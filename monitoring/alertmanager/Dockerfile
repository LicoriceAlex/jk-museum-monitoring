FROM prom/alertmanager:v0.27.0
RUN apk add --no-cache gettext
COPY alertmanager.tmpl.yml /etc/alertmanager/alertmanager.tmpl.yml
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
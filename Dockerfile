FROM grafana/grafana
MAINTAINER Pedro César <pedrocesar.ti@gmail.com>

ADD conf/grafana.db /var/lib/grafana/grafana.db
ADD conf/home.json /usr/share/grafana/public/dashboards/home.json

ENV GF_SERVER_ROOT_URL http://localhost
ENV GF_SECURITY_ADMIN_PASSWORD pedrocesars

ENTRYPOINT ["/run.sh"]

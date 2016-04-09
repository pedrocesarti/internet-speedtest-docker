FROM grafana/grafana
MAINTAINER Pedro César <pedrocesar.ti@gmail.com>

RUN mkdir /var/lib/grafana/dashboards

#ADD conf/grafana.ini /etc/grafana/grafana.ini
#ADD conf/home.json /var/lib/grafana/dashboards/home.json

ENV GF_SERVER_ROOT_URL http://grafana.server.name
ENV GF_SECURITY_ADMIN_PASSWORD secret

ENTRYPOINT ["/run.sh"]

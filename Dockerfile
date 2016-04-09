FROM grafana/grafana
MAINTAINER Pedro César <pedrocesar.ti@gmail.com>

ADD conf/grafana.ini /etc/grafana/grafana.ini

ENV GF_SERVER_ROOT_URL http://grafana.server.name
ENV GF_SECURITY_ADMIN_PASSWORD secret

ENTRYPOINT ["/run.sh"]

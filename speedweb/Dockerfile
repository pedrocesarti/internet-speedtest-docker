FROM grafana/grafana
MAINTAINER Pedro César de Azevedo <pedrocesar.ti@gmail.com>

COPY conf/home.json /usr/share/grafana/public/dashboards/home.json
COPY provisioning/ /etc/grafana/provisioning

ENV GF_SERVER_ROOT_URL http://localhost
ENV GF_SECURITY_ADMIN_PASSWORD admin
ENV GF_AUTH_ANONYMOUS_ENABLED true

USER root
RUN chown -R root:root /etc/grafana && \
  chmod -R a+r /etc/grafana && \
  chown -R 472:472 /var/lib/grafana

USER grafana
ENTRYPOINT ["/run.sh"]

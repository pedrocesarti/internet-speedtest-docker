FROM tutum/nginx
MAINTAINER Pedro César <pedrocesar.ti@gmail.com>

ENV GRAFANA_VERSION 1.9.1

RUN apt-get update && apt-get install -y wget apache2-utils
RUN wget http://grafanarel.s3.amazonaws.com/grafana-${GRAFANA_VERSION}.tar.gz -O grafana.tar.gz && \
    tar zxf grafana.tar.gz && \
    rm grafana.tar.gz && \
    rm -rf app && \
    mkdir -p /app && \
    mv grafana-${GRAFANA_VERSION} /app/grafana

ADD conf/config.js /app/grafana/config.js
ADD conf/default /etc/nginx/sites-enabled/default

ENV HTTP_USER admin
ENV HTTP_PASS **Random**

ENV INFLUXDB_PROTO http
ENV INFLUXDB_HOST **ChangeMe**
ENV INFLUXDB_PORT 8086
ENV INFLUXDB_NAME **ChangeMe**
ENV INFLUXDB_USER root
ENV INFLUXDB_PASS root
ENV INFLUXDB_IS_GRAFANADB false

ADD scripts/init_grafana.sh /app/grafana/init_grafana.sh
RUN chmod +x /app/grafana/init_grafana.sh

CMD bash -c /app/grafana/init_grafana.sh

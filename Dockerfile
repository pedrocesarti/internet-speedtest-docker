FROM tutum/nginx
MAINTAINER Pedro César <pedrocesar.ti@gmail.com>

ENV GRAFANA_VERSION 1.9.1

RUN apt-get update && apt-get install -y wget && 
    wget http://grafanarel.s3.amazonaws.com/grafana-${GRAFANA_VERSION}.tar.gz -O grafana.tar.gz && \
    tar zxf grafana.tar.gz && \
    rm grafana.tar.gz && \
    rm -rf app && \
    mkdir -p /app && \
    mv grafana-${GRAFANA_VERSION} /app/grafana

ADD conf/config.js /app/grafana/config.js
ADD conf/default /etc/nginx/sites-enabled/default

# Environment variables for HTTP AUTH
ENV HTTP_USER admin
ENV HTTP_PASS **Random**

ENV INFLUXDB_PROTO http
ENV INFLUXDB_HOST **ChangeMe**
ENV INFLUXDB_PORT 8086
ENV INFLUXDB_NAME **ChangeMe**
ENV INFLUXDB_USER root
ENV INFLUXDB_PASS root
ENV INFLUXDB_IS_GRAFANADB false

ADD run.sh /app/grafana/run.sh
ADD set_influx_db.sh /set_influx_db.sh
ADD set_basic_auth.sh /set_basic_auth.sh
RUN chmod +x /*.sh

CMD bash -c /app/grafana/run.sh

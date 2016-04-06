#!/bin/bash

echo "=> Creating basic auth for \"${HTTP_USER}\" user with ${_word} password"
echo ${PASS} | htpasswd -i -c /app/.htpasswd  ${HTTP_USER}
echo "=> Done!"


echo "=> Configuring InfluxDB"
sed -i -e "s/<--PROTO-->/${INFLUXDB_PROTO}/g" \
    -e "s/<--GRAFANADB-->/${INFLUXDB_IS_GRAFANADB}/g" \
    -e "s/<--ADDR-->/${INFLUXDB_HOST}/g" \
    -e "s/<--PORT-->/${INFLUXDB_PORT}/g" \
    -e "s/<--DB_NAME-->/${INFLUXDB_NAME}/g" \
    -e "s/<--USER-->/${INFLUXDB_USER}/g" \
    -e "s/<--PASS-->/${INFLUXDB_PASS}/g" /app/grafana/config.js

echo "=> Starting and running Nginx..."
/usr/sbin/nginx

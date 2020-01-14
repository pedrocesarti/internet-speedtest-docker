FROM python:3-alpine
MAINTAINER Pedro César de Azevedo <pedrocesar.ti@gmail.com>

RUN mkdir -p /app/speedtest/ &&\
    apk add --no-cache --update curl &&\
    curl https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py -o /app/speedtest/speedtest-cli &&\
    chmod +x /app/speedtest/speedtest-cli

COPY scripts/ /app/speedtest/

CMD sh -c /app/speedtest/init_test_connection.sh

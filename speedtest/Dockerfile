FROM python:2-alpine
MAINTAINER Pedro César de Azevedo <pedrocesar.ti@gmail.com>

RUN mkdir -p /app/speedtest/
RUN apk add --update curl
RUN curl https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py -o /app/speedtest/speedtest-cli
RUN chmod +x /app/speedtest/speedtest-cli

ADD scripts/ /app/speedtest/

CMD sh -c /app/speedtest/init_test_connection.sh

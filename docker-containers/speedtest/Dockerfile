FROM ubuntu:trusty
MAINTAINER Pedro César <pedrocesar.ti@gmail.com>

RUN mkdir -p /app/speedtest/
RUN apt-get update && apt-get install -y wget python curl
RUN wget https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py -O /app/speedtest/speedtest_cli.py
RUN chmod +x /app/speedtest/speedtest_cli.py

ADD scripts/ /app/speedtest/

CMD bash -c /app/speedtest/init_test_connection.sh
#!/bin/bash
set -x
# docker run -d -p 80:80 -p 3000:3000 -p 8080:8080 -v /home/deploy/Dropbox/Code/internet-speedtest-docker/scripts/haproxy-override:/haproxy-override haproxy:1.8.7-alpine
docker run -d -p 3000:3000 -p 8080:8080 -v $PWD/scripts/haproxy-override:/usr/local/etc/haproxy/ haproxy:1.8.7-alpine
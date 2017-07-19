#!/bin/bash
set -x
docker run -d -p 80:80 -p 3000:3000 -p 8080:8080 -v /home/deploy/Dropbox/Code/internet-speedtest-docker/minikube/haproxy-override:/haproxy-override dockerfile/haproxy
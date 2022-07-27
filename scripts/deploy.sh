#!/bin/bash
set -x 

minikube addons enable ingress
# kubectl apply -f k8s/ingress/traefik-rbac.yaml
# kubectl apply -f k8s/ingress/traefik-deployment.yaml
# kubectl apply -f k8s/ingress/traefik-ui.yaml


kubectl apply -f k8s/db-deployment.yaml
kubectl apply -f k8s/db-service.yaml 
kubectl apply -f k8s/testing-deployment.yaml 
kubectl apply -f k8s/testing-service.yaml 
kubectl apply -f k8s/web-deployment.yaml 
kubectl apply -f k8s/web-service.yaml
kubectl apply -f k8s/web-ingress.yaml
#!/bin/bash
set -x 

minikube addons enable ingress

kubectl create -f k8s/db-deployment.yaml
kubectl create -f k8s/db-service.yaml 
kubectl create -f k8s/testing-deployment.yaml 
kubectl create -f k8s/testing-service.yaml 
kubectl create -f k8s/web-deployment.yaml 
kubectl create -f k8s/web-service.yaml
kubectl create -f k8s/ingress.yaml
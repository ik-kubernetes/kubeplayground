#!/bin/bash

set -euo pipefail

echo "Test minikube"

kubectl run hello-minikube \
  --image=k8s.gcr.io/echoserver:1.4 \
  --port=8080
kubectl get pods --all-namespaces
kubectl expose deployment hello-minikube --type=NodePort
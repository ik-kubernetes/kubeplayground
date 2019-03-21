#!/bin/bash

set -euo pipefail

COMMAND=${1:-plan}


# minikube $COMMAND --memory 4048
# https://github.com/knative/docs/blob/master/install/Knative-with-Minikube.md
# minikube config set kubernetes-version v1.12.1
# minikube set vm-driver virtualbox
# minikube config set vm-driver virtualbox
# minikube config set memory 8192
# minikube config set cpus 4

minikube start --memory=8192 --cpus=4 \
  --kubernetes-version=v1.12.1 \
  --vm-driver=virtualbox
cat $HOME/.minikube/config/config.json
echo -e "\n"
# minikube start

echo "Show namespaces"
kubectl get pods --all-namespaces

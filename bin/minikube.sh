#!/bin/bash

set -euo pipefail

COMMAND=${1:-plan}


# minikube $COMMAND --memory 4048
# https://github.com/knative/docs/blob/master/install/Knative-with-Minikube.md
minikube start --memory=8192 --cpus=4 \
  --kubernetes-version=v1.10.5 \
  --vm-driver=virtualbox \
  --bootstrapper=kubeadm \
  --extra-config=controller-manager.cluster-signing-cert-file="/var/lib/localkube/certs/ca.crt" \
  --extra-config=controller-manager.cluster-signing-key-file="/var/lib/localkube/certs/ca.key" \
  --extra-config=apiserver.admission-control="LimitRanger,NamespaceExists,NamespaceLifecycle,ResourceQuota,ServiceAccount,DefaultStorageClass,MutatingAdmissionWebhook"

# curl -L https://raw.githubusercontent.com/knative/serving/v0.1.1/third_party/istio-1.0.2/istio.yaml \
#   | sed 's/LoadBalancer/NodePort/' \
#   | kubectl apply --filename -
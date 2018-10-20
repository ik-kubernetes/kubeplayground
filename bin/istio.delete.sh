#!/bin/bash

set -euo pipefail

echo "Helm & Tiller Configuration"

ISTIO="$(pwd)/istio"
echo "Ready to delete Istio"
helm delete --purge istio
kubectl delete -f istio/install/kubernetes/helm/istio/templates/crds.yaml -n istio-system

echo "Show current services"
kubectl get pods --all-namespaces
echo "Show custom resource definitions"
kubectl get customresourcedefinitions
echo "Verifying the installation"
kubectl get svc -n istio-system
echo "Get Istio Pods"
kubectl get pods -n istio-system
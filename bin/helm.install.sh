#!/bin/bash

set -euo pipefail

echo "Helm & Tiller Configuration"
echo ">> Setup Service Account for Tiller if NOT already installed"

ISTIO="$(pwd)/istio-1.0.2"
kubectl apply -f ${ISTIO}/install/kubernetes/helm/helm-service-account.yaml

echo "> Install Tiller on cluster with the service account"
helm init --service-account tiller --wait

kubectl get pods --all-namespaces

echo "Ready to deploy Istio"
helm install ${ISTIO}/install/kubernetes/helm/istio \
  --name istio --namespace istio-system 
  # --set global.nodePort=true \
  # --set ingress.enabled=true \
  # --set gateways.istio-ingressgateway.enabled=true \
  # --set ingressgateway.service.type=NodePort \
  # --set gateways.custom-gateway.type=NodePort \
  # --set galley.enabled=false \
  # --set grafana.enabled=true \
  # --set mixer.enabled=true \
  # --set prometheus.enabled=true \
  # --set mtls.enabled=true \
  # --set servicegraph.enabled=true \
  # --wait

# helm install ${ISTIO}/install/kubernetes/helm/istio \
#   --name istio-minimal --namespace istio-system \
#   --set security.enabled=false \
#   --set ingress.enabled=true \
#   --set gateways.istio-ingressgateway.enabled=false \
#   --set gateways.istio-egressgateway.enabled=false \
#   --set galley.enabled=false \
#   --set sidecarInjectorWebhook.enabled=true \
#   --set servicegraph.enabled=true \
#   --set mixer.enabled=false \
#   --set prometheus.enabled=true \
#   --set grafana.enabled=true \
#   --set global.proxy.envoyStatsd.enabled=false \
#   --set pilot.sidecar=true \
#   --set mtls.enabled=true \
#   --wait

echo "Show current services"
kubectl get pods --all-namespaces

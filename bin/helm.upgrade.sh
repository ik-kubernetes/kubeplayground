#!/bin/bash

set -euo pipefail

echo "Helm Upgrade Istio"

ISTIO="$(pwd)/istio-1.0.2"
helm upgrade \
--set grafana.enabled=true \
--set servicegraph.enabled=true \
istio \
${ISTIO}/install/kubernetes/helm/istio
  # --set global.nodePort=true \
  # --set ingress.enabled=true \
  # --set gateways.istio-ingressgateway.enabled=true \
  # --set ingressgateway.service.type=NodePort \
  # --set gateways.custom-gateway.type=NodePort \
  # --set galley.enabled=false \
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

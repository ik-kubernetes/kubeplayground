#!/bin/bash

set -euo pipefail
echo "1"
# Download and unpack Istio
ISTIO_VERSION=1.0.2
DOWNLOAD_URL=https://github.com/istio/istio/releases/download/${ISTIO_VERSION}/istio-${ISTIO_VERSION}-linux.tar.gz

wget $DOWNLOAD_URL
tar xzf istio-${ISTIO_VERSION}-linux.tar.gz
cd istio-${ISTIO_VERSION}

# Create template
helm template --namespace=istio-system \
  --set sidecarInjectorWebhook.enabled=true \
  --set sidecarInjectorWebhook.enableNamespacesByDefault=true \
  --set global.proxy.autoInject=disabled \
  --set prometheus.enabled=false \
  install/kubernetes/helm/istio > istio/minikube/istio.yaml

helm template --namespace=istio-system \
  --set sidecarInjectorWebhook.enabled=false \
  --set global.proxy.autoInject=disabled \
  --set global.omitSidecarInjectorConfigMap=true \
  --set prometheus.enabled=false \
  install/kubernetes/helm/istio > istio/minikube/istio-lean.yaml

# Clean up.
cleanup() {
  cd ..
  rm -rf istio-${ISTIO_VERSION}
  rm istio-${ISTIO_VERSION}-linux.tar.gz
}
trap cleanup EXIT

Add in the `istio-system` namespace, so we only need to
run one kubectl command to install istio.
patch istio/minikube/istio.yaml istio/minikube/namespace.yaml.patch
patch istio/minikube/istio-lean.yaml istio/minikube/namespace.yaml.patch
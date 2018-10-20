#!/bin/bash

# set -euo pipefail

echo "Custom Resource Definitions"
kubectl get customresourcedefinitions
echo "Virtual Services"
kubectl get virtualservices
echo "Destination Rules"
kubectl get destinationrules
echo "Gateways"
kubectl get gateway
echo "Pods"
kubectl get pods
echo "Rules"
kubectl get rules --all-namespaces
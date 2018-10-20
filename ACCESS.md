

<!-- http://localhost:3000/dashboard/db/istio-dashboard -->
kubectl port-forward $(kubectl get pod -l app=grafana -o jsonpath='{.items[0].metadata.name}') 3000:3000 &
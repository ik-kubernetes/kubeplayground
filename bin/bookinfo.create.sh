
kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml
kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml

sudo kubectl -n istio-system port-forward istio-ingressgateway-69b597b6bd-hl8fz 80


for i in {1..10}; do curl -o /dev/null -s -w "%{http_code}\n" http://${GATEWAY_URL}/productpage; done

 prometheus port forwading
 kubectl -n istio-system port-forward $(kubectl -n istio-system get pod -l app=prometheus -o jsonpath='{.items[0].metadata.name}') 9090:9090

for ((i=1;i<=100;i++)); do  curl -o /dev/null -s -w "%{http_code}\n" "http://${GATEWAY_URL}/productpage"; done

port forward Grafana
kubectl -n istio-system port-forward $(kubectl -n istio-system get pod -l app=prometheus -o jsonpath='{.items[0].metadata.name}') 9090:9090

SYSTEM GRAPGH
kubectl -n istio-system port-forward $(kubectl -n istio-system get pod -l app=servicegraph -o jsonpath='{.items[0].metadata.name}') 8088:8088
http://localhost:8088/force/forcegraph.html
http://localhost:8088/dotviz
http://localhost:8088/dotgraph

grafama
kubectl -n istio-system port-forward $(kubectl -n istio-system get pod -l app=grafana -o jsonpath='{.items[0].metadata.name}') 3000:3000
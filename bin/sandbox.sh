
kubectl run hello-minikube --image=k8s.gcr.io/echoserver:1.4 --port=8080
kubectl expose deployment hello-minikube --type=NodePort
kubectl get pod hello-minikube-6c47c66d8-x9vwj -o jsonpath="{.status.phase}"
curl $(minikube service hello-minikube --url)
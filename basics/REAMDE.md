
Create a Cluster


Cluster details `kubectl cluster-info`
Wiew nodes in the cluster `kubectl get nodes`


Deploy an Application


Verify if nodes are running Docker
```
kubectl get nodes -o=jsonpath=$'{range .items[*]}{@.metadata.name}: {@.status.nodeInfo.containerRuntimeVersion}\n{end}'
```

Deploy app
```
kubectl run kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1 --port=8080
kubectl get deployments
```


Start the proxy
```
kubectl proxy
```

Get the pod name and Run a proxy command
```
export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME
url http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME/proxy/
```

Most Common operations
```
kubectl get - list resources
kubectl describe - show detailed information about a resource
kubectl logs - print the logs from a container in a pod
kubectl exec - execute a command on a container in a pod
```

Kubernetes Useful Commands
```
kubectl logs $POD_NAME
kubectl exec $POD_NAME env
kubectl exec -ti $POD_NAME bash
```

K8S expopse service to external world
```
kubectl expose deployment/kubernetes-bootcamp --type="NodePort" --port 8080
```

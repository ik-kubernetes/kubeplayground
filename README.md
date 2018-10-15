# Kubernetes Training

## Notes

[Tasks](https://kubernetes.io/docs/tasks/)
[Commands](https://kubernetes.io/docs/reference/kubectl/overview/#custom-columns)
[K8S Basics Apps Source Code](https://github.com/kubernetes/website/tree/master/content/en/docs/tutorials)
[AppArmor](https://github.com/kubernetes/website/blob/master/content/en/docs/tutorials/clusters/apparmor.md)
[K8S Concepts](https://kubernetes.io/docs/concepts/)
[Pods](https://kubernetes.io/docs/concepts/workloads/pods/pod/#durability-of-pods-or-lack-thereof)
[Pods Lifecycle](https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/)
[Patterns: Composite Container](https://kubernetes.io/blog/2015/06/the-distributed-system-toolkit-patterns/)
[AWS EKS Getting Started](https://docs.aws.amazon.com/eks/latest/userguide/getting-started.html)
[kNative](https://github.com/knative/docs/blob/master/install/Knative-with-Minikube.md)
[kNative Docs](https://github.com/knative/docs)
[K8S Cheetsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
[Minikube](https://continuous.lu/2017/04/28/minikube-and-helm-kubernetes-package-manager/)
[Helm Minikube](https://medium.com/@anthonyganga/getting-started-with-helm-tiller-in-kubernetes-part-one-3250aa99c6ac)

## Extras

[ElasticSearch](https://github.com/knative/serving/tree/master/third_party/config/monitoring/elasticsearch)

## Pre-requisites

- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/installing.html)
- [Terraform CLI](https://www.terraform.io/intro/getting-started/install.html)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [AWS Iam Authenticator](https://docs.aws.amazon.com/eks/latest/userguide/getting-started.html)
- [AWS Vault](https://github.com/99designs/aws-vault)
- [K8s Helm](brew install kubernetes-helm)

## How to Run

```
export ENVIRONMENT=dev
aws-vault exec $AWS_PROFILE -- make terraform
export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config:k8s_configs/config-demo
eport KUBE_AUTH="k8s_configs/config-map-aws-auth.yaml"
aws-vault exec $AWS_PROFILE -- kubectl cluster-info
aws-vault exec $AWS_PROFILE -- kubectl apply -f $KUBE_AUTH
aws-vault exec $AWS_PROFILE -- kubectl get nodes --watch
```

Test deployments
```
aws-vault exec $AWS_PROFILE -- kubectl run kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1 --port=8080
aws-vault exec $AWS_PROFILE -- kubectl get deployments
aws-vault exec $AWS_PROFILE -- kubectl proxy
```

Delete deployements
```
aws-vault exec $AWS_PROFILE -- kubectl delete deployment <>
```

Questions:
How to expose service to make it available outside of the cluster?


## TODO



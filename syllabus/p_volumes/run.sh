#!/bin/bash

set -euo pipefail

: $ENVIRONMENT

aws-vault exec $AWS_PROFILE -- kubectl get services wordpress
aws-vault exec $AWS_PROFILE -- kubectl describe services/wordpress
aws-vault exec $AWS_PROFILE -- kubectl expose deployment/wordpress --type="NodePort" --port 80
export NODE_PORT=$(aws-vault exec $AWS_PROFILE -- kubectl get services/wordpress -o go-template='{{(index .spec.ports 0).nodePort}}')
echo NODE_PORT=$NODE_PORT

aws-vault exec $AWS_PROFILE -- kubectl get pods -l app=wordpress
export POD_NAME=$(aws-vault exec $AWS_PROFILE -- kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME

aws-vault exec $AWS_PROFILE -- kubectl get services wordpress --url


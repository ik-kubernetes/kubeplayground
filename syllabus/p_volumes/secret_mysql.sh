#!/bin/bash
# https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/
set -euo pipefail

: $ENVIRONMENT


aws-vault exec $AWS_PROFILE -- kubectl create secret generic mysql-pass --from-literal=password=asdgfqwetgqeqwer
aws-vault exec $AWS_PROFILE -- kubectl create -f syllabus/p_volumes/mysql-deployment.yml
aws-vault exec $AWS_PROFILE -- kubectl get pvc
aws-vault exec $AWS_PROFILE -- kubectl get nodes

# delete
aws-vault exec $AWS_PROFILE -- kubectl delete -f syllabus/p_volumes/mysql-deployment.yml
aws-vault exec $AWS_PROFILE -- kubectl delete -f syllabus/p_volumes/wordpress-deployment.yml


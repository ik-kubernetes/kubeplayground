#!/bin/bash

set -euo pipefail

: $ENVIRONMENT

COMMAND=${1:-plan}
OPTS=
[ "$COMMAND" = plan ] || OPTS=-auto-approve

STATE="$ENVIRONMENT-base.tfstate"
ENV_VARS="$ENVIRONMENT.tfvars"

terraform init terraform/aws
terraform $COMMAND $OPTS -var-file="data/$ENV_VARS" -state="data/$STATE" -refresh=true terraform/aws/
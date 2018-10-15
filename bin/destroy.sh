#!/bin/bash

set -euo pipefail

: $ENVIRONMENT


TERRAFORM_DIR="terraform/aws"
STATE="$ENVIRONMENT-base.tfstate"
ENV_VARS="$ENVIRONMENT.tfvars"

terraform destroy -auto-approve \
  -var-file="data/$ENV_VARS" -state="data/$STATE" "$TERRAFORM_DIR"

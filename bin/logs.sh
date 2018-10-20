#!/bin/bash

set -euo pipefail

echo "Show logs"
NAME="$1"
NAMESPACE="$2"

kubectl logs -f $NAME -n $NAMESPACE
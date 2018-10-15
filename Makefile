
.EXPORT_ALL_VARIABLES:
.PHONY: terraform

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

start_minikube: ## Start minikube
	@bin/minikube.sh start

istio_install: ## Install Istio
	@bin/istio.sh


.EXPORT_ALL_VARIABLES:
.PHONY: terraform

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

start_minikube: ## Start minikube
	@bin/minikube.sh start

test_minikube: ## Smoke test minikube
	@bin/minikube_smoke.sh

helm_setup: ## Install Helm
	@bin/helm.install.sh

istio_install: ## Install Istio
	@bin/istio.sh

istio_delete: ## DeleteIstio
	@bin/istio.delete.sh




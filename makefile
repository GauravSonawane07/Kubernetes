# Define variables
 KIND_CLUSTER_NAME := kind-test
 KIND_CONFIG := kind.yaml
 NAMESPACE := ingress-nginx
# Create Kind Cluster
create-cluster:
	kind create cluster --name $(KIND_CLUSTER_NAME) --config $(KIND_CONFIG)

# Delete Kind Cluster
delete-cluster:
	kind delete cluster --name $(KIND_CLUSTER_NAME)

# Install nginx ingress controller
install-ingress:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

# Check pod status
check-pods:
	kubectl get pods -n $(NAMESPACE)

# Clean up
destroy:
	make delete-cluster

# Show nodes in the cluster
show-nodes:
	kubectl get nodes

.PHONY: create-cluster delete-cluster install-ingress check-pods destroy show-nodes

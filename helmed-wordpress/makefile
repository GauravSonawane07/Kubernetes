# Makefile for deploying WordPress using Helm

# Variables
CLUSTER_NAME = kind
CHART_NAME = wordpress
CHART_REPO = https://groundhog2k.github.io/helm-charts/  # Replace with the actual repo URL
CHART_VERSION = 0.8.4
HELM_RELEASE_NAME = my-wordpress
WORDPRESS_IMAGE_TAG = "6.2.1-apache"
NEW_CHART_VERSION = 0.12.1

# Targets
.PHONY: all create-cluster install-wordpress upgrade-wordpress unset-wordpress-version

all: install-wordpress

install-wordpress:
	@echo "Installing WordPress..."
	helm repo add my-repo $(CHART_REPO)
	helm repo update
	helm install $(HELM_RELEASE_NAME) my-repo/$(CHART_NAME) --version $(CHART_VERSION) \
		-f values.yaml || true  # Ignore error if already installed

upgrade-wordpress:
	@echo "Upgrading WordPress...to version $(WORDPRESS_IMAGE_TAG) "
	helm upgrade $(HELM_RELEASE_NAME) my-repo/$(CHART_NAME) --version $(NEW_CHART_VERSION) \
		--set image.tag=$(WORDPRESS_IMAGE_TAG) \
		-f values.yaml

unset-wordpress-version:
	@echo "Unsetting WordPress version..."
	helm upgrade $(HELM_RELEASE_NAME) my-repo/$(CHART_NAME) --version $(NEW_CHART_VERSION) \
		-f values.yaml \
		--set image.tag=""


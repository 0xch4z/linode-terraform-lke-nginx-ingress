KUBECONFIG_PATH := ./kubeconfig.yaml
KUBECTL_ARGS    := --kubeconfig $(KUBECONFIG_PATH)

deploy-cluster:
	terraform init
	terraform apply --auto-approve
	terraform show --no-color

fmt:
	terraform fmt --recursive

kubectl-get-all:
	kubectl $(KUBECTL_ARGS) get all -owide

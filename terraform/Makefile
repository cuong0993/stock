# $ make env-file=.env

load_envs:=set -o allexport; source $(env-file); set +o allexport

all: check init apply

.PHONY: check
check:
	@command -v terraform >/dev/null || ( echo "terraform is not installed"; exit 1 )
	@command -v gcloud >/dev/null || ( echo "gcloud is not installed"; exit 1 )

.PHONY: init
init:
	${load_envs} && terraform init -backend-config="bucket=tf-state-$${ENV_GCP_PROJECT_ID}"

.PHONY: apply
apply:
	terraform apply -var-file=$(env-file)

.PHONY: destroy
destroy:
	terraform destroy -var-file=$(env-file)

init:
	terraform -chdir=terraform init

plan:
	terraform -chdir=terraform plan

plan-local:
	terraform -chdir=terraform plan -var-file=secret.tfvars

deploy:
	terraform -chdir=terraform apply
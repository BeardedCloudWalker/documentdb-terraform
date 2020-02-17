.SHELL := /bin/bash
PLAN=.terraform/ddb-terraform.tfplan 
default: help

init: 
	terraform init

plan:
	terraform plan \
	-var-file=fiterraform.tfvars \
	-out $(PLAN)


apply: plan
	terraform apply $(PLAN)

destroy:
	terraform destroy

clean:
	rm -rf .terraform
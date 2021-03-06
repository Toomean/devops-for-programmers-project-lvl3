setup:
	make -C ansible setup
	make -C terraform setup

# Ansible
install:
	make -C ansible install

deploy:
	make -C ansible deploy

list:
	make -C ansible list

# Terraform
init:
	make -C terraform init

plan:
	make -C terraform plan

apply:
	make -C terraform apply

destroy:
	make -C terraform destroy

show:
	make -C terraform show

lint:
	terraform -chdir=terraform fmt

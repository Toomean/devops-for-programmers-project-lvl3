init:
	make -C terraform init

plan:
	make -C terraform plan

apply:
	make -C terraform apply

destroy:
	make -C terraform destroy

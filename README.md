### Hexlet tests and linter status:
[![Actions Status](https://github.com/Toomean/devops-for-programmers-project-lvl3/workflows/hexlet-check/badge.svg)](https://github.com/Toomean/devops-for-programmers-project-lvl3/actions)

### Requirements
1. Make
2. Ansible:2.7
3. `ansible/.ansible_secret` file

### Add Terraform variables
1. Create ./terraform/*.auto.tfvars file
2. Add necessary variables

```HCL
do_token = "<digital_ocean_api_token>"
pvt_key = "<path_to_digital_ocean_ssh_key>"
ssh_key = "<digital_ocean_ssh_key_name>"
domain_name = "<domain_name_to_create>"
subdomain = "<subdomain_to_create>"

region = "<digital_ocean_region>"
web_droplet_count = <digital_ocean_desired_web_droplets_count>

datadog_api_key = "<datadog_api_key>"
datadog_app_key = "<datadog_app_key>"
datadog_api_url = "<datadog_api_url>"
```

### Install ansible dependencies and init Terraform
`make setup`

### Create Terraform infra
`make plan`
`make apply`

### Add droplet ips into ansible/hosts.ini
example:
```
[webservers]
<droplet_alias> ansible_host=<droplet_ip> ansible_user=<ansible_user>
<droplet_alias> ansible_host=<droplet_ip> ansible_user=<ansible_user>
```

### Add ansible variables
- vault_datadog_api_key
- redmine_db_postgres
- redmine_db_username
- redmine_db_password
- redmine_db_database
- redmine_db_port


### Deploy on servers
`make deploy-servers`

#### Balancer info
![Balancer screenshot](https://raw.githubusercontent.com/Toomean/devops-for-programmers-project-lvl3/main/.github/images/balancer.png)

[Balancer URL](https://hexlet.toomean.com)
setup:
	make install

install:
	ansible-galaxy collection install -r requirements.yml
	ansible-galaxy role install -r requirements.yml

setup-servers:
	ansible-playbook -i hosts.ini setup_servers.yml

deploy-servers:
	ansible-playbook -i hosts.ini playbook.yml

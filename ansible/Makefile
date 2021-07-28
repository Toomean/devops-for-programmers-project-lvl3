setup:
	make install

install:
	ansible-galaxy collection install -r requirements.yml
	ansible-galaxy role install -r requirements.yml

deploy:
	ansible-playbook -i hosts.ini playbook.yml --vault-password-file .ansible_secret

.PHONY: default test

AUTOSSH_TARBALL = autossh-1.4g.tgz
AUTOSSH_URL = https://www.harding.motd.ca/autossh/$(AUTOSSH_TARBALL)
VENDOR_DIR = vendor

default:
	@echo 'usage: make <target>'
	@echo
	@echo 'make test'
	@echo 'make vendor_update'
	@echo 'make vagrant_setup'
	@echo '...'

vendor_clean:
	@echo 'cleaning up vendor binaries'
	cd $(VENDOR_DIR) && rm *.tgz

vendor_update:
	@echo 'downloading latest vendor binaries'
	mkdir -p $(VENDOR_DIR)
	cd $(VENDOR_DIR) && curl -R -o "$(AUTOSSH_TARBALL)" -z "$(AUTOSSH_TARBALL)" $(AUTOSSH_URL)
	
vagrant_reset:
	vagrant destroy --force && vagrant up

vagrant_setup:
	sudo apt-get -y update
	sudo apt-get -y upgrade
	sudo apt-get -y install language-pack-en
	sudo locale-gen en_GB.UTF-8
	sudo apt-get -y install git
	sudo mkdir /app && chown vagrant:vagrant /app
	sudo mkdir /app/cache && chown vagrant:vagrant /app/cache
	sudo mkdir /app/env && chown vagrant:vagrant /app/env

vagrant_start:
	vagrant up && vagrant ssh

test:
	bash bin/detect /tmp
	bash bin/compile /tmp /app/cache /app/env
	bash bin/release /tmp

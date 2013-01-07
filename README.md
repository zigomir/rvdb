# Ruby Vagrant Development Box

It's based on Vagrant and Ubuntu 12.04 x64 Server Edition (Precise)

Install [Vagrant](http://www.vagrantup.com/)

# Setting up machine

### Vagrantfile

	cp vagrantconfig.yml vagrantconfig_local.yml

Set your settings inside **vagrantconfig_local.yml**

First one may take time because it will go and download ubuntu and set it all up

    vagrant up
    vagrant ssh

# Sources

	https://github.com/blt04/puppet-rvm
	https://github.com/akumria/puppet-postgresql

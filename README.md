# Ruby Vagrant Development Box

Based on Vagrant and Ubuntu 12.04 x64 Server Edition (Precise)

What you will get?

* mysql and postgres database
* rvm and ruby-1.9.3-p327
* nodejs and npm
* git

# Setting up machine

First install [VirtualBox](https://www.virtualbox.org/) and [Vagrant](http://www.vagrantup.com/)

### Vagrantfile

	cp vagrantconfig.yml vagrantconfig_local.yml

Set your settings inside **vagrantconfig_local.yml**

First one may take time because it will go and download ubuntu and set it all up

    vagrant up
    vagrant ssh
    
*vagrant ssh* won't work on Windows. Use [putty](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) 
and connect to guest ip you've set up in **vagrantconfig_local.yml** file. (Username and password are vagrant/vagrant)

# Sources

	https://github.com/blt04/puppet-rvm
	https://github.com/akumria/puppet-postgresql

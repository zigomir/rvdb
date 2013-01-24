# Ruby Vagrant Development Box

Based on Vagrant and Precise64 (Ubuntu 12.04 x64 Server Edition)

## Installed software

* rbenv and ruby-1.9.3-pXXX
* mysql
* git, node, npm, vim
* casperjs

Install [Vagrant](http://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/)

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

# Possible issues

## On Windows host machine
Error with .rbenvrc

    sudo apt-get install dos2unix
    dos2unix .rbenvrc
    source .rbenvrc

## Check selected ruby version

    ruby -v

If it's not what 1.9.3-pXXX just say

    rbenv local 1.9.3-pXXX

## Can't see newly installed bundles?

    rbenv rehash

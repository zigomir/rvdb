# Ruby Vagrant Development Box

Based on Vagrant and Precise64 (Ubuntu 12.04 x64 Server Edition)

## Installed software

* rbenv and ruby-1.9.3-pXXX
* mysql
* git, node, npm, vim
* casperjs

Install [Vagrant](http://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/)

# Setting up machine

### Vagrantfile

	cp vagrantconfig.yml vagrantconfig_local.yml

Set your settings inside **vagrantconfig_local.yml**

Init and clone submodules

    git submodule init
    git submodule update

First one may take time because it will go and download ubuntu and set it all up

    vagrant up
    vagrant ssh

# Adding rbenv submodule

This one needs to be in modules/rbenv and not in modules/puppet-rbenv or else it won't work properly

    git submodule add git://github.com/alup/puppet-rbenv.git modules/rbenv

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

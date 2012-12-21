# Ruby Vagrant Development Box

It's based on Vagrant and Ubuntu 12.04 x64 Server Edition (Precise)

# Prerequisites

* Install Ruby https://rvm.io/rvm/install
* Install VirtualBox https://www.virtualbox.org/wiki/Downloads
* Install Vagrant

        gem install vagrant

# Setting up machine

### Vagrantfile

    IP, share folder and ports

Open up private/puppet/manifests/base.pp file and comment out projects/packages you don't need.
Also add new ones that you need and send a pull request or just make a fork of this repo.

First one may take time because it will go and download ubuntu and set it all up

    vagrant up
    vagrant ssh

## Dependencies

	https://github.com/blt04/puppet-rvm
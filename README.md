# Ruby Vagrant Development Box

It's based on Vagrant and Ubuntu 12.04 x64 Server Edition (Precise)

Install [Vagrant](http://www.vagrantup.com/)

# Setting up machine

### Vagrantfile

Set IP, share folder and ports

Open up private/puppet/manifests/base.pp file and comment out projects/packages you don't need.

First one may take time because it will go and download ubuntu and set it all up

    vagrant up
    vagrant ssh

## Dependencies

	https://github.com/blt04/puppet-rvm

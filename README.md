# Ruby Vagrant Development Box

Based on Vagrant and Precise64 (Ubuntu 12.04 x64 Server Edition)

## Installed software

* rbenv and ruby-2.0.0-p195 or 1.9.3-pXXX
* postgres or mysql

# Setting up machine

First install [VirtualBox](https://www.virtualbox.org/) and then [Vagrant](http://www.vagrantup.com/)

## Setup

This code needs to be in your home `.rvdb` directory

    git clone git://github.com/zigomir/rvdb.git ~/.rvdb

Run this to create project's `Vagrantfile` and `vagrantconfig.yml` files inside your project dir.

    cd /path/to/project
    ~/.rvdb/vagrantify.sh .

If you are on Windows create project's `Vagrantfile` and `vagrantconfig.yml` file with copying by hand

    cp ~/.rvdb/Vagrantfile.PROJECT path/to/project/Vagrantfile
    cp ~/.rvdb/vagrantconfig.EXAMPLE.yml path/to/project/vagrantconfig.yml

If you have special settings (different directory structure for project), different than your team mates, just create another file, named `vagrantconfig_local.yml` and edit your setting there.

# Build mah machine
Update git submodules

    git submodule init
    git submodule update

Change directory to your project folder

    vagrant up

First run may take time because it will go and download Ubuntu and set it all up

    vagrant ssh
    
*vagrant ssh* won't work on Windows. Use [putty](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) 
and connect to guest ip you've set up in **vagrantconfig_local.yml** file. (Username and password are vagrant/vagrant)

## Puppet modules with git submodules

First update all submodules

    git submodule init
    git submodule update

Don't add puppet-rbenv to modules/puppet-rbenv ! it won't work because puppet module name must be the same like directory structure.

Example of adding submodules:

    git submodule add git://github.com/alup/puppet-rbenv.git modules/rbenv
    git submodule add git://github.com/akumria/puppet-postgresql.git modules/postgresql


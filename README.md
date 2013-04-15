# Ruby Vagrant Development Box

Based on Vagrant and Precise64 (Ubuntu 12.04 x64 Server Edition)

## Installed software

* rbenv and ruby-2.0.0-p0 or 1.9.3-pXXX
* postgres or mysql
* git, node, vim
* optional, not in by default: casperjs, todo...

# Setting up machine

First install [VirtualBox](https://www.virtualbox.org/) and then [Vagrant](http://www.vagrantup.com/)

## Setup

This code needs to be in your home `.rvdb` directory

    git clone git://github.com/zigomir/rvdb.git ~/.rvdb

Creating a symlink to `Vagrantfile`

    cd project
    mkdir vagrant
    cd vagrant
    ln -s ~/.rvdb/Vagrantfile Vagrantfile
    # Windows (cmd, not power shell, with admin privileges)
    mklink Vagrantfile C:\users\<your_username>\.rvdb\Vagrantfile

Copy `vagrantconfig.example.yml` to your project `vagrant` dir and rename it to `vagrantconfig.yml`

If you have special settings (different directory structure for project), different than your team mates, just
create another file, named `vagrantconfig_local.yml` and edit your setting there.

	cp vagrantconfig.yml vagrantconfig_local.yml

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
    git submodule add git://github.com/zigomir/puppet-torquebox.git modules/torquebox
    git submodule add git://github.com/akumria/puppet-postgresql.git modules/postgresql

If you want to push back to submodules uzse git@github.com:zigomir instead of git://github.com/zigomir

## Updating Ruby

Connect to your box and do this

	cd ~/.rbenv/plugins/ruby-build
	git pull --rebase

Than update version in your base manifest file, example:

	rbenv::compile { '2.0.0-p0':

and than run `vagrant provison`

# Passwords

- linux user: `vagrant/vagrant`
- postgres: `vagrant/vagrant`
- mysql: `root/root`

Connecting to postgres from command line:

    sudo -u postgres psql

# Possible issues

## On Windows host machine
Error with .rbenvrc

    cd
	sudo apt-get install dos2unix
    dos2unix .rbenvrc
    source .rbenvrc

Always set CRLF to false, otherwise you'll get messed up bash files

	git config --global core.eol lf
	git config --global core.autocrlf false

## Check selected ruby version

    ruby -v

If it's not what 1.9.3-pXXX just say

    rbenv local 1.9.3-pXXX

## Can't see newly installed bundles?

    rbenv rehash

## Upgrading to Vagrant API version 2:

Problem with NFS share. Just remove `/etc/exports` file.

## TODO

- try re adding TB because of newlines
- better structure for new projects

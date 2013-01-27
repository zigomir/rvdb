# Ruby Vagrant Development Box

Based on Vagrant and Precise64 (Ubuntu 12.04 x64 Server Edition)

## Installed software

* rbenv and ruby-1.9.3-pXXX
* mysql
* git, node, npm, vim
* casperjs

# Setting up machine

First install [VirtualBox](https://www.virtualbox.org/) and then [Vagrant](http://www.vagrantup.com/)

## Vagrantfile

    cd mri

If you don't have yet symlink for Vagrantfile from mri (or other) directory, create it

    ln -s Vagrantfile ../Vagrantfile # *nix
    mklink Vagrantfile ..\Vagrantfile # Winodws (with admin privileges)

Copy and edit settings file

	cp vagrantconfig.yml vagrantconfig_local.yml

Set your settings inside **vagrantconfig_local.yml**


# Build mah machine
Than from your terminal inside this project type

    vagrant up

First run may take time because it will go and download Ubuntu and set it all up

    vagrant ssh
    
*vagrant ssh* won't work on Windows. Use [putty](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) 
and connect to guest ip you've set up in **vagrantconfig_local.yml** file. (Username and password are vagrant/vagrant)

## Dealing with puppet modules from Git(Hub)

First update all submodules

    git submodule foreach git pull

Example of adding submodules

    # don't add puppet-rbenv to modules/puppet-rbenv ! it won't work
    git submodule add git://github.com/alup/puppet-rbenv.git modules/rbenv
    git submodule add git://github.com/zigomir/puppet-torquebox.git modules/torquebox

If you want to push back to submodules uzse git@github.com:zigomir instead of git://github.com/zigomir

# Possible issues

## On Windows host machine
Error with .rbenvrc

    cd
    dos2unix .rbenvrc
    source .rbenvrc

## Check selected ruby version

    ruby -v

If it's not what 1.9.3-pXXX just say

    rbenv local 1.9.3-pXXX

## Can't see newly installed bundles?

    rbenv rehash


## TODO

* install only requirements for given database
* find a good module for installing postgres with UTF-8 encodings

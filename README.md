# Ruby Vagrant Development Box

Based on Vagrant and Precise64 (Ubuntu 12.04 x64 Server Edition)

## Available software packages in a box

* rbenv and ruby
* postgres, sqlite3, mysql

## Setup

First install [VirtualBox](https://www.virtualbox.org/) and then [Vagrant](http://www.vagrantup.com/)

This repository needs to be in your home `.rvdb` directory

```bash
git clone git://github.com/zigomir/rvdb.git ~/.rvdb --recursive
```

## Using rvdb on your project

Create project's `Vagrantfile` and `vagrantconfig.yml` files inside your project dir with 
`vagrantify.sh` script:

```bash
cd /path/to/project
~/.rvdb/vagrantify.sh .
```

If you are on Windows create project's `Vagrantfile` and `vagrantconfig.yml` file with copying by hand

```
cp ~/.rvdb/Vagrantfile.PROJECT path/to/project/Vagrantfile
cp ~/.rvdb/vagrantconfig.EXAMPLE.yml path/to/project/vagrantconfig.yml
```

If you have special settings (different directory structure for project), different than your team mates, just create another file, named `vagrantconfig_local.yml` and edit your setting there.

# Build me machine

Change directory to your project folder

```bash
vagrant up
```

First run may take time because it will go and download Ubuntu and set it all up

```bash
vagrant ssh
```

## Databases

### Postgres

Credentials: `vagrant/vagrant`

Connecting to postgres from command line

```bash
sudo -u postgres psql
```

If you want your user to be super user, connect to postgres and run

```bash
ALTER USER vagrant WITH SUPERUSER;
```
    
### MySQL

Credentials: `root/root`

## Puppet modules with git submodules

First update all submodules

    git submodule init
    git submodule update

Don't add puppet-rbenv to modules/puppet-rbenv ! it won't work because puppet module name must be the same like directory structure.

Example of adding submodules:

    git submodule add git://github.com/alup/puppet-rbenv.git modules/rbenv
    git submodule add git://github.com/akumria/puppet-postgresql.git modules/postgresql

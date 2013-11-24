Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

notice('Your conf from vagrantconfig.yml is: ')
notice($conf)

# include misc for parser functions to get configuration from facter variable $conf
include misc
include ohmyzsh

$ruby_version = get_fact($conf, 'ruby_version')
if $ruby_version {
  rbenv::install { 'vagrant':
    group => 'vagrant',
    home  => '/home/vagrant'
  }

  rbenv::compile { $ruby_version:
    user => 'vagrant',
    home => '/home/vagrant'
  }
}

$rubyGems = get_fact_array($conf, 'rubygems')
rbenv::gem { $rubyGems:
  user => 'vagrant',
  ruby => $ruby_version,
}

$modules = get_fact_array($conf, 'modules')
if fact_array_includes($modules, 'golang') {
  include golang
}
if fact_array_includes($modules, 'nodejs') {
  include nodejs
}
if fact_array_includes($modules, 'phantomjs') {
  include phantomjs
}

$databases = get_fact_array($conf, 'databases')
if fact_array_includes($databases, 'sqlite3') {
  package { "libsqlite3-dev":
    ensure => present
  }
}

if fact_array_includes($databases, 'mysql') {
  include mysql
}

if fact_array_includes($databases, 'postgres') {
  class {'postgresql':  }
  class {'postgresql::server':
    listen => ['*'],
    version => '9.1',
    locale => 'en_US.UTF-8',
    acl    => ['host all all 192.168.2.1/32 md5']
  }
  pg_user {'vagrant':
    ensure   => present,
    password => 'vagrant',
    createdb   => true,
    createrole => true,
    superuser  => true
  }

  package { 'libpq-dev':
    ensure => present
  }
}

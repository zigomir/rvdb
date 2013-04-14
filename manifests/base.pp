Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

include misc
include ohmyzsh

if $ruby == 'mri' {
  rbenv::install { 'vagrant':
    group => 'vagrant',
    home  => '/home/vagrant'
  }

  rbenv::compile { $ruby_version:
    user => 'vagrant',
    home => '/home/vagrant'
  }
}

if $ruby == 'torquebox' {
  torquebox::install { 'install-torquebox':
    tb_version   => '2.3.0',
    java_version => '7' # 6 or 7
  }

  include torquebox::config, torquebox::service
}

if $database == 'mysql' {
  include mysql
}

if $database == 'postgres' {
  class {'postgresql':  }
  class {'postgresql::server':
    listen => ['*'],
    version => '9.1',
    locale => 'en_US.UTF-8',
    acl    => ['host all all 192.168.2.1/32 md5', ],
  }
  pg_user {'vagrant':
    ensure   => present,
    password => 'vagrant',
    createdb   => true,
    createrole => true,
  }

  package { 'libpq-dev':
    ensure => present
  }
}

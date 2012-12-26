Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

# Database servers
include mysql

# install client and server, create user and set encodings
class {'postgresql':  }
class {'postgresql::server':
  listen => ['*'],
  acl    => ['host all all 192.168.2.1/32 md5', ],
}
pg_user {'vagrant':
  ensure   => present,
  password => 'vagrant',
  createdb   => true,
  createrole => true,
}

# freaking encodingz
exec { "psql -c \"update pg_database set encoding = pg_char_to_encoding('UTF8') where datname = 'postgres';\"":
  user    => 'postgres',
  require => pg_user['vagrant']
}
exec { "psql -c \"update pg_database set encoding = pg_char_to_encoding('UTF8') where datname = 'template0';\"":
  user    => 'postgres',
  require => pg_user['vagrant']
}
exec { "psql -c \"update pg_database set encoding = pg_char_to_encoding('UTF8') where datname = 'template1';\"":
  user    => 'postgres',
  require => pg_user['vagrant']
}

# RVM and Ruby
include rvm

rvm::system_user { 'vagrant': }
rvm_system_ruby { 'ruby-1.9.3-p327':
  ensure => 'present'
}

# other dev tools like Node, ...
include misc

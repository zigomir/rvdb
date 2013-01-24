class mysql {

  package { 'mysql-client': ensure => installed }
  package { 'mysql-server': ensure => installed }

  # package { 'libpq-dev':            ensure => installed } # added for postgres
  # added for mysql and ruby integration
  package { 'libmysql-ruby':        ensure => installed }
  package { 'libmysqlclient-dev':   ensure => installed }

  exec { "set-mysql-user-and-password":
    subscribe   => [ Package["mysql-server"], Package["mysql-client"] ],
    refreshonly => true,
    command     => "mysqladmin -u$mysql_user password $mysql_password",
    unless      => "mysqladmin -u$mysql_user -p$mysql_password status",
    path        => "/bin:/usr/bin",
  }

  exec { "mysql -u $mysql_user -p$mysql_password -e \"GRANT ALL ON *.* to $mysql_user@'192.168.2.1' IDENTIFIED BY '$mysql_password';\"":
    unless  => "mysql -u $mysql_user -p$mysql_password -e \"SHOW GRANTS FOR root@'192.168.2.1';\"",
    require  => [Package['mysql-server'], Exec['set-mysql-user-and-password']],
  }

  exec { "mysql -u $mysql_user -p$mysql_password -e \"GRANT ALL ON *.* to $mysql_user@'localhost' IDENTIFIED BY '$mysql_password';\"":
    unless  => "mysql -u $mysql_user -p$mysql_password -e \"SHOW GRANTS FOR root@'localhost';\"",
    require  => [Package['mysql-server'], Exec['set-mysql-user-and-password']],
  }

  file { 'my.cnf':
    path    => '/etc/mysql/my.cnf',
    ensure  => file,
    require => Package['mysql-server'],
    source  => 'puppet:///modules/mysql/my.cnf',
    mode    => 644,
    notify  => Service["mysql"],
  }

  service { "mysql":
    ensure   => "running",
    enable   => "true",
    require  => Package["mysql-server"],
    provider => 'upstart',
  }
}
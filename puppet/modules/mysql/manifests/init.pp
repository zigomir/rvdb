class mysql {
  $password = "root"
  package { "mysql-client": ensure => installed }
  package { "mysql-server": ensure => installed }

  exec { "Set MySQL server root password":
    subscribe => [ Package["mysql-server"], Package["mysql-client"] ],
    refreshonly => true,
    unless => "mysqladmin -uroot -p$password status",
    path => "/bin:/usr/bin",
    command => "mysqladmin -uroot password $password",
  }

  exec { "mysql -u root -proot -e \"GRANT ALL ON *.* to root@'192.168.2.1' IDENTIFIED BY 'root';\"":
    require => package['mysql-server']
  }

  exec { "mysql -u root -proot -e \"GRANT ALL ON *.* to root@'localhost' IDENTIFIED BY 'root';\"":
    require => package['mysql-server']
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

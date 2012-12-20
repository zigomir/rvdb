class postgres {
  package { 'postgresql':
    ensure => present,
  }

  user { 'postgres':
    ensure  => present,
    require => Package['postgresql']
  }

  group { 'postgres':
    ensure  => 'present',
    require => User['postgres']
  }

  exec { "createuser":
    command => "createuser -U postgres -SdRw vagrant",
    user    => 'postgres',
    path    => $path,
    unless  => "psql -c \"SELECT * FROM pg_user WHERE usename='vagrant'\" | grep -c vagrant",
    require => Group['postgres']
  }

  exec { "psql -c \"ALTER USER vagrant WITH PASSWORD 'root'\"":
    user    => 'postgres',
    path    => $path,
    require => Exec['createuser']
  }
}

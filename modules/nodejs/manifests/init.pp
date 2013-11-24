class nodejs {

  $deps = ["python-software-properties"]

  package { $deps:
    ensure => present
  }

  exec { "add-nodejs-ppa":
    command => "add-apt-repository ppa:chris-lea/node.js",
    unless  => "grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep chris-lea",
    require => Package[$deps]
  }

  exec { "apt-update":
    command => "/usr/bin/apt-get update",
    unless  => "grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep chris-lea",
    require => Exec["add-nodejs-ppa"]
  }

  package { "nodejs":
    ensure  => present,
    require => [Exec["add-nodejs-ppa"], Exec["apt-update"]]
  }

}

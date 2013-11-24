class golang {

  $deps = ["python-software-properties"]

  package { $deps:
    ensure => present
  }

  exec { "add-golang-ppa":
    command => "sudo add-apt-repository ppa:duh/golang",
    unless  => "grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep duh",
    require => Package[$deps]
  }

  exec { "apt-update":
    command => "/usr/bin/apt-get update",
    unless  => "grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep duh",
    require => Exec["add-golang-ppa"]
  }

  package { "golang":
    ensure  => present,
    require => [Exec["add-golang-ppa"], Exec["apt-update"]]
  }

}

class misc {

  $toolsDirectory = "/home/vagrant/tools"

  $miscPackages = get_fact_array($conf, 'packages')

  package { $miscPackages:
    ensure => present
  }

  file { $toolsDirectory:
    ensure => "directory"
  }
}

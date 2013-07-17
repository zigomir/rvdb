class misc {

  $miscPackages = get_fact_array($conf, 'packages')

  package { $miscPackages:
    ensure => present
  }
}

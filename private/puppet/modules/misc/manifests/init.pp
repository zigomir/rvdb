class misc {

  $miscPackages = [
    "git",
    "nodejs",
    "npm"
  ]

  package { $miscPackages:
    ensure => present,
  }

}

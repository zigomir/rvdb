class misc {

  $miscPackages = [
    "git",
    "nodejs",
    "npm",
    "vim"
  ]

  package { $miscPackages:
    ensure => present,
  }

}

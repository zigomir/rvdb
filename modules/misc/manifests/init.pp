class misc {

  $miscPackages = [
    "vim",
    "git",
    "nodejs"
  ]

  package { $miscPackages:
    ensure => present
  }
}

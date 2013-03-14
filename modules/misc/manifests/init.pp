class misc {

  $miscPackages = [
    "dos2unix",
    "vim",
    "git",
    "nodejs"
  ]

  package { $miscPackages:
    ensure => present
  }
}

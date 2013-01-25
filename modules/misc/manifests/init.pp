class misc {

  $miscPackages = [
    "git",
    "nodejs",
    "npm",
    "vim",
    "imagemagick"
  ]

  package { $miscPackages:
    ensure => present,
  }

}

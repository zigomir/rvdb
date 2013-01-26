class misc {

  $miscPackages = [
    "git",
    "nodejs",
    "npm",
    "vim",
    "imagemagick",
    "dos2unix",      # for windows hack
    "libsqlite3-dev" # for ruby sqlite 3 gem
  ]

  package { $miscPackages:
    ensure => present
  }

  # Problems for Windows host machines
  exec { "format-rbenvrc":
    command => "dos2unix /home/vagrant/.rbenvrc",
    require => [Package['dos2unix'], File['/home/vagrant/.rbenvrc']]
  }
}

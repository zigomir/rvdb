class misc {

  $toolsDirectory = "/home/vagrant/tools"

  $miscPackages = [
    "vim",
    "git",
    # rubber ring deps
    "imagemagick",
    "libsqlite3-dev"
  ]

  package { $miscPackages:
    ensure => present
  }

  file { $toolsDirectory:
    ensure => "directory"
  }
}

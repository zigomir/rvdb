class misc {

  $toolsDirectory = "/home/vagrant/tools"

  $miscPackages = [
    "vim",
    "git",
    # rubber ring deps
    "imagemagick"
  ]

  package { $miscPackages:
    ensure => present
  }

  file { $toolsDirectory:
    ensure => "directory"
  }
}

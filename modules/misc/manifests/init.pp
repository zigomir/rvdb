class misc {

  $miscPackages = [
    "git",
    "nodejs",
    "npm",
    "vim",
    "imagemagick",
    "dos2unix",       # for windows hack
    "libsqlite3-dev", # for ruby sqlite 3 gem
    "yui-compressor"  # for minifying with catapult
  ]

  package { $miscPackages:
    ensure => present
  }
}

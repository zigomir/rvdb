class phantomjs {

  $toolsDirectory = "/home/vagrant/tools"
  $deps = ["fontconfig"]

  package { $deps:
    ensure => present
  }

  exec { "phantomjs-download":
    cwd     => $toolsDirectory,
    command => "wget https://phantomjs.googlecode.com/files/phantomjs-1.9.0-linux-x86_64.tar.bz2",
    unless  => "test -f $toolsDirectory/phantomjs-1.9.0-linux-x86_64/bin/phantomjs",
    require => File[$toolsDirectory]
  }

  exec { "phantomjs-install":
    cwd     => $toolsDirectory,
    command => "tar xjvf phantomjs-1.9.0-linux-x86_64.tar.bz2 && ln -sf $toolsDirectory/phantomjs-1.9.0-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs",
    unless  => "test -f /usr/local/bin/phantomjs",
    require => [Exec["phantomjs-download"], Package[$deps]]
  }

}

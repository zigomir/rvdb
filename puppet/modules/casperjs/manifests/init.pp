class casperjs {

  $toolsDirectory = "/home/vagrant/tools"
  $phantomjsDeps = ["fontconfig"]

  package { $phantomjsDeps:
    ensure => present
  }

  file { $toolsDirectory:
    ensure => "directory"
  }

  exec { "phantomjs-download":
    cwd     => $toolsDirectory,
    command => "wget http://phantomjs.googlecode.com/files/phantomjs-1.8.0-linux-x86_64.tar.bz2",
    unless  => "test -f $toolsDirectory/phantomjs-1.8.0-linux-x86_64/bin/phantomjs",
    require => File[$toolsDirectory]
  }

  exec { "phantomjs-install":
    cwd     => $toolsDirectory,
    command => "tar xjvf phantomjs-1.8.0-linux-x86_64.tar.bz2 && ln -sf $toolsDirectory/phantomjs-1.8.0-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs",
    unless  => "test -f /usr/local/bin/phantomjs",
    require => Exec["phantomjs-download"]
  }

  exec { "casperjs-download":
    cwd     => $toolsDirectory,
    command => "git clone https://github.com/n1k0/casperjs.git",
    unless  => "test -f $toolsDirectory/casperjs/bin/casperjs",
    require => File[$toolsDirectory]
  }

  exec { "casperjs-install":
    cwd     => "$toolsDirectory/casperjs",
    command => "git checkout tags/1.0.0 && ln -sf `pwd`/bin/casperjs /usr/local/bin/casperjs",
    unless  => "test -f /usr/local/bin/casperjs",
    require => Exec["casperjs-download"]
  }

}

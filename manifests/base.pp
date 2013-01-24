Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

# Database servers
include mysql

# other dev tools like Node, ...
include misc

# casper js and phantom js for functional tests 
include casperjs

rbenv::install { 'vagrant':
  group => 'vagrant',
  home  => '/home/vagrant'
}

rbenv::compile { '1.9.3-p374':
  user => 'vagrant',
  home  => '/home/vagrant'
}

Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

rbenv::install { 'vagrant':
  group => 'vagrant',
  home  => '/home/vagrant'
}

rbenv::compile { '1.9.3-p374':
  user => 'vagrant',
  home => '/home/vagrant'
}

include mysql, misc, casperjs

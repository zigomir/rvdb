Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

include mysql, misc

if $ruby == 'mri' {
  rbenv::install { 'vagrant':
    group => 'vagrant',
    home  => '/home/vagrant'
  }

  rbenv::compile { '1.9.3-p374':
    user => 'vagrant',
    home => '/home/vagrant'
  }
}

if $ruby == 'torquebox' {
  torquebox::install { 'install-torquebox':
    tb_version   => '2.3.0',
    java_version => '7' # 6 or 7
  }

  include torquebox::config, torquebox::service
}

if $casperjs {
  include casperjs
}

Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

# Database servers
include mysql
include postgres

# RVM and Ruby
include rvm

rvm_system_ruby { 'ruby-1.9.3-p327':
  ensure => 'present',
  default_use => true;
}

# other dev tools like Node, ...
include misc

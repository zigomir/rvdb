Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

notice('Your conf from vagrantconfig.yml is: ')
notice($conf)

# include misc for parser functions to get configuration from facter variable $conf
# and for installing all packages specified in vagrantconfig.yml
include misc

exec { "pip install virtualenv":
  unless  => "test -f /usr/local/bin/virtualenv",
  command => "pip install virtualenv",
}

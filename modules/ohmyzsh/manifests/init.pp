class ohmyzsh {

  $deps = ["curl"]

  package { $deps:
    ensure => present
  }

  # Install ZSH
  package { "zsh":
    ensure => latest,
  }

  # Clone oh-my-zsh
  exec { 'clone oh-my-zsh':
    cwd     => "/home/vagrant",
    user    => "vagrant",
    command => "git clone git://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh",
    creates => "/home/vagrant/.oh-my-zsh",
    require => [Package["git"], Package["zsh"], Package["curl"]]
  }

  # Set configuration
  file { '/home/vagrant/.zshrc':
    ensure  => file,
    content => template('ohmyzsh/zshrc.erb'),
    owner   => "vagrant",
    group   => "vagrant",
    require => Exec["clone oh-my-zsh"],
  }

  # Set the shell
  exec { "chsh -s /usr/bin/zsh vagrant":
    unless  => "grep -E '^vagrant.+:/usr/bin/zsh$' /etc/passwd",
    require => Package["zsh"],
  }
}

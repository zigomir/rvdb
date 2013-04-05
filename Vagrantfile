# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'

_config = YAML.load(File.open('vagrantconfig.yml'))
begin
  _config = YAML.load(File.open('vagrantconfig_local.yml'))

  # No vagrantconfig_local.yml found -- that's OK; just use the defaults.
  rescue Errno::ENOENT
end

CONF = _config

Vagrant.configure('2') do |config|
  config.vm.box     = CONF['box_name']
  config.vm.box_url = CONF['box_url']

  config.vm.provider :virtualbox do |vb|
    # Set unique name for VirtualBox from ruby implementation
    vb.customize ['modifyvm', :id, '--name', CONF['name']]

    # VirtualBox memory
    vb.customize ['modifyvm', :id, '--memory', CONF['memory']]
  end

  # Set IP you want to use for VirtualMachine
  config.vm.network :private_network, ip: CONF['guest_ip']

  # Set the default project share to use nfs
  config.vm.synced_folder CONF['host_development_dir'], 
                          CONF['guest_development_dir'],
                          :nfs => (RUBY_PLATFORM =~ /linux/ or RUBY_PLATFORM =~ /darwin/)

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  CONF['ports'].each do |port|
    config.vm.network :forwarded_port, guest: port['guest'], host: port['host']
  end

  # Puppet Provisioning #
  # Set the Timezone and locale
  config.vm.provision :shell, :inline => "echo \"#{CONF['timezone']}\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"
  config.vm.provision :shell, :inline => 'locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8'

  # Update the server
  config.vm.provision :shell, :inline => 'apt-get update --fix-missing'

  # run puppet modules
  config.vm.provision :puppet, :module_path => '../modules' do |puppet|
    puppet.manifest_file  = 'base.pp'
    puppet.manifests_path = '../manifests'
    puppet.facter         = {
      :ruby           => CONF['ruby'],
      :database       => CONF['database'],
      :ruby_version   => CONF['ruby_version']
    }
  end
end

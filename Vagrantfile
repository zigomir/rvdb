# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant::Config.run do |config|
  config.vm.box = "rvdb"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # VirtualBox memory
  # config.vm.customize ["modifyvm", :id, "--memory", 512]

  # Set IP you want to use for VirtualMachine
  config.vm.network :hostonly, "192.168.2.60"

  # Set the default project share to use nfs
  config.vm.share_folder "v-data", "~/development", "~/development"

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  config.vm.forward_port 3000, 3000 # rails
  config.vm.forward_port 1234, 1234 # ruby remote debugger


  # Puppet Provisioning #

  # Set the Timezone and locale
  config.vm.provision :shell, :inline => "echo \"Europe/Ljubljana\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"
  config.vm.provision :shell, :inline => "locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8"

  # Update the server
  config.vm.provision :shell, :inline => "apt-get update --fix-missing"
  # run puppet modules
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.manifest_file  = "base.pp"
  end
end

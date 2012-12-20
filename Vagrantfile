# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant::Config.run do |config|
  config.vm.box = "rvdb"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # VirtualBox memory
  config.vm.customize ["modifyvm", :id, "--memory", 512]

  # Set IP you want to use for VirtualMachine
  config.vm.network :hostonly, "192.168.2.60"

  # Set the default project share to use nfs
  config.vm.share_folder "v-data", "~/development", "~/development"

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  config.vm.forward_port 3000, 3000


  # Puppet Provisioning #

  # Set the Timezone to something useful
  config.vm.provision :shell, :inline => "echo \"Europe/Ljubljana\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"
  # Update the server
  config.vm.provision :shell, :inline => "apt-get update --fix-missing"
  # run puppet modules
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "private/puppet/manifests"
    puppet.module_path = "private/puppet/modules"
    puppet.manifest_file  = "base.pp"
  end
end

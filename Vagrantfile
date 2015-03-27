# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # Ubuntu 14.04 box
  config.vm.box = "ubuntu/trusty64"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Share everything inside this repo to /vagrant on the host
  config.vm.synced_folder ".", "/vagrant", type: "nfs"

  # Bootstrap our Vagrant
  config.vm.provision "shell", path: "provisions/bootstrap.sh"
end

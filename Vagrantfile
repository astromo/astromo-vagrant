# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # Ubuntu 14.04 box
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |v|
    # Increase our Box's performance
    v.memory = 1024
    v.cpus = 2
  end

  # Forward our SSH agent
  config.ssh.forward_agent = true

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Share everything inside this repo to /vagrant on the host
  config.vm.synced_folder ".", "/vagrant", type: "nfs"

  # Enable creating symlinks inside our NFS folder
  # Used for npm install
  # http://blog.liip.ch/archive/2012/07/25/vagrant-and-node-js-quick-tip.html
  config.vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]

  # Bootstrap our Vagrant
  config.vm.provision "shell",
  path: "provisions/bootstrap.sh",
  privileged: true

  # Run our code
  config.vm.provision "shell",
  path: "provisions/run.sh",
  privileged: false
end

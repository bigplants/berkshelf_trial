# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.ssh.insert_key = false
  config.vm.box = "ubuntu/trusty32"
  config.vm.network "private_network", ip: "192.168.50.100"
  config.vm.provider :virtualbox do |vb|
    vb.memory = 1024
    vb.cpus = 1
  end
  if Vagrant.has_plugin?("vagrant-omnibus")
    config.omnibus.chef_version = '11.4.4'
  end
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.auto_detect = true
    config.cache.scope = :box
  end
  if Vagrant.has_plugin?("vagrant-triggers")
    config.trigger.after [:reload, :halt], stdout: true do
      `rm .vagrant/machines/default/virtualbox/synced_folders`
    end
  end
  config.berkshelf.enabled = true
  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
      "mysql",
      "nginx"
    ]
  end
end

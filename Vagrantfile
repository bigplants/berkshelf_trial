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
    config.omnibus.chef_version = 'latest'
  end
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.auto_detect = true
    config.cache.scope = :box
  end
  if Vagrant.has_plugin?("vagrant-triggers")
    config.trigger.after [:reload, :halt], stdout: true do
      `rm .vagrant/machines/default/virtualbox/synced_folders`
      `pkill vagrant-notify-server`
    end
  end
  config.berkshelf.enabled = true
  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "mysettings"
    chef.add_recipe "nginx"
    chef.add_recipe "redisio"
    chef.add_recipe "redisio::enable"
    chef.add_recipe "php"
    chef.add_recipe "composer"
    chef.add_recipe "php-fpm"
    chef.add_recipe "php-mcrypt"
    chef.add_recipe "nodejs"
    chef.add_recipe "ruby"
    chef.json = {
      nodejs: {
        npm_packages: [
          {name: "bower"},
          {name: "gulp"},
        ]
      }
    }
  end
end

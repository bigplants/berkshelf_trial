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
    chef.json = {
      "nodejs"=> {
        "npm_packages"=> [
          {"name"=> "bower"},
          {"name"=> "gulp"},
          {"name"=> "coffee-script"},
          {"name"=> "less"},
          {"name"=> "redis-commander"},
        ]
      },
      "blackfire"=> {
        "agent"=> {
          "server-id"=> "0690f6ac-6897-43e7-8bcb-f86a3910bb29",
          "server-token"=> "b49c8c3d7c85bcfef8dc688a3cc61430e039dde4c069312f1d1abc8d57c79131"
        },
        "php"=> {
          "server-id"=> "0690f6ac-6897-43e7-8bcb-f86a3910bb29",
          "server-token"=> "b49c8c3d7c85bcfef8dc688a3cc61430e039dde4c069312f1d1abc8d57c79131"
        }
      }
    }
  end
end

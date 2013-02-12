# -*- mode: ruby -*-
# vi: set ft=ruby sw=2 sts=2 :

Vagrant::Config.run do |config|
  config.vm.define :centos63_web do |c|
    c.vm.box = "centos63_web"
    c.vm.box_url = "http://tom.davidson.me.uk/dev/vagrant/centos63-32.box"
    # c.vm.boot_mode = :gui
    c.vm.network :hostonly, "192.168.33.20"
    c.vm.customize do |v|
      vm.memory_size = 512
      vm.name = "centos63_web"
    end
    c.vm.provision :chef_solo do |prov|
      prov.cookbooks_path = "cookbooks"
      prov.run_list = "recipe[web]"
    end
  end
  config.vm.define :centos63_db do |c|
    c.vm.box = "centos63_db"
    c.vm.box_url = "http://tom.davidson.me.uk/dev/vagrant/centos63-32.box"
    # c.vm.boot_mode = :gui
    c.vm.network :hostonly, "192.168.33.10"
    c.vm.customize do |v|
      vm.memory_size = 512
      vm.name = "centos63_db"
    end
    c.vm.provision :chef_solo do |prov|
      prov.cookbooks_path = "cookbooks"
      prov.run_list = "recipe[db]"
    end
  end
end

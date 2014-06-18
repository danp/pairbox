VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.synced_folder File.expand_path("~/Projects"), "/projects"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", 2048]
  end

  config.omnibus.chef_version = :latest

  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "git"
    chef.add_recipe "mercurial"
    chef.add_recipe "ruby"
    chef.add_recipe "go"
    chef.add_recipe "nodejs"
    chef.add_recipe "postgresql"
    chef.add_recipe "redis"
    chef.add_recipe "emacs"
    chef.add_recipe "tmux"
  end
end

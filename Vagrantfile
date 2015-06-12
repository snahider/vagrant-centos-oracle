# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos65-64"
  # config.vm.box_url = "https://vagrantcloud.com/nrel/boxes/CentOS-6.5-x86_64"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  # ansible is not supported on windows, so we bootstrap it in VM and run the playbooks
  require 'rbconfig'
  is_windows = (RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/)
  if is_windows
    config.vm.provision "shell" do |sh|
      sh.path = "provisioning/windows.sh"
      sh.args = "provisioning/oracle-xe.yml provisioning/inventory"
    end
  else
    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "provisioning/oracle-xe.yml"
    end
  end

  config.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true
  config.vm.network "forwarded_port", guest: 1521, host: 1521, auto_correct: true
end

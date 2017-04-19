# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
<<<<<<< HEAD
  # vagrant box
  config.vm.box = "centos/7"
  
  # provisioning puppet server  
  config.vm.define "server" do |server|
    server.vm.hostname = "server.hv"
    server.vm.network :private_network, ip: "192.168.20.200"
    server.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 2
    end
    server.vm.provision "shell", inline: <<-SHELL
      # Update hosts file
      echo "192.168.20.200 server.hv puppet" >> /etc/hosts
      echo "192.168.20.50  agent.hv" >> /etc/hosts
      # Restart network service
      systemctl restart network.service
      # Install puppet
      yum install epel-release.noarch -y
      yum install puppet -y
      systemctl start puppet
      # Apply module
      source ~/.bashrc
      puppet apply /vagrant/site.pp --modulepath=/vagrant/modules/
    SHELL
  end

  # provisioning puppet agent
  config.vm.define "agent" do |agent|
    agent.vm.hostname = "agent.hv"
    agent.vm.network :private_network, ip: "192.168.20.50"
    agent.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 1
    end
    agent.vm.provision "shell", inline: <<-SHELL
      # Update hosts file
      echo "192.168.20.200 server.hv puppet" >> /etc/hosts
      echo "192.168.20.50  agent.hv" >> /etc/hosts
      # Restart network service
      systemctl restart network.service
      # Install puppet
      yum install epel-release.noarch -y
      yum install puppet -y
      systemctl start puppet
      # Apply module
      source ~/.bashrc
      puppet apply /vagrant/site.pp --modulepath=/vagrant/modules/
      systemctl restart puppet
    SHELL
  end
   config.vm.synced_folder ".", "/vagrant", type: "virtualbox"  
=======

  config.vm.box = "centos/7"

  config.vm.define "agent" do |puppet|
    puppet.vm.hostname = "agent.hv"
    puppet.vm.provider "virtualbox" do |vb|
      vb.name = puppet.vm.hostname
      vb.memory = 1024
    end
    puppet.vm.network :private_network, ip: "192.168.20.10"
    puppet.vm.provision "shell", inline: <<-SHELL
    echo "192.168.20.100  server.hv puppet" >> /etc/hosts  
    echo "192.168.20.10  agent.hv" >> /etc/hosts
    systemctl restart network.service
    yum install epel-release.noarch -y 
    yum install puppet -y 
    systemctl start puppet 
    
    source ~/.bashrc
    puppet apply /vagrant/default.pp --modulepath=/vagrant/modules
    systemctl restart puppet 
  SHELL
 end


   config.vm.define "server" do |puppet|
    puppet.vm.hostname = "server.hv"
    puppet.vm.provider "virtualbox" do |vb|
      vb.name = puppet.vm.hostname
      vb.memory = 4096
      vb.cpus = 2
    end
    puppet.vm.network :private_network, ip: "192.168.20.100"
    puppet.vm.provision "shell", inline: <<-SHELL  
    echo "192.168.20.100  server.hv puppet" >> /etc/hosts  
    echo "192.168.20.10  agent.hv" >> /etc/hosts
    systemctl restart network.service
    yum install epel-release.noarch -y 
    yum install puppet -y 
    systemctl start puppet 
    
    source ~/.bashrc
    puppet apply /vagrant/default.pp --modulepath=/vagrant/modules
    systemctl restart puppet    
  SHELL
 end
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
>>>>>>> 2993b460b9ca627cef88ab43a383a5735c244b24
end

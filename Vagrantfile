# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1024"
    vb.name = "habitat-example"
  end

  config.vm.provision "shell", inline: <<-SHELL
    curl https://raw.githubusercontent.com/habitat-sh/habitat/master/components/hab/install.sh | sudo bash

    sudo apt-get install \
         apt-transport-https \
         ca-certificates \
         curl \
         software-properties-common

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    sudo add-apt-repository \
          "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
          $(lsb_release -cs) \
          stable"

    sudo apt-get update

    sudo apt-get install -y docker-ce
    sudo usermod -aG docker ubuntu
  SHELL

end

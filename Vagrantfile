# -*- mode: ruby -*-
# vi: set ft=ruby :
unless Vagrant.has_plugin?("vagrant-reload")
   raise 'requires: "vagrant plugin install vagrant-reload" prior to use'
end

Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.ssh.insert_key = false
  config.vm.provider "virtualbox"

  config.vm.define "centos" do |node|
    node.vm.box = "centos/7"
    node.vm.provision "shell", inline: <<-SHELL
       sed -i s/^#baseurl/baseurl/g /etc/yum.repos.d/CentOS-Base.repo
       sed -i s/^mirror/#mirror/g /etc/yum.repos.d/CentOS-Base.repo
       sed -i s+mirror.centos.org+192.168.1.15/pub+g /etc/yum.repos.d/CentOS-Base.repo
       yum clean all
       yum update -y
       yum install gcc kernel-devel kernel-headers dkms make bzip2 perl epel-release -y
       sed -i s/^#baseurl/baseurl/g /etc/yum.repos.d/epel.repo
       sed -i s/^mirror/#mirror/g /etc/yum.repos.d/epel.repo
       sed -i s+download.fedoraproject.org+192.168.1.15+g /etc/yum.repos.d/epel.repo
       yum clean all
    SHELL
    node.vm.provision :reload 
    node.vm.provision "shell", inline: <<-SHELL
       curl -OL http://download.virtualbox.org/virtualbox/5.1.28/VBoxGuestAdditions_5.1.28.iso
       mkdir -p /media/VBoxGuestAdditions
       mount -o loop,ro VBoxGuestAdditions_5.1.28.iso /media/VBoxGuestAdditions
       sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
       rm VBoxGuestAdditions_5.1.28.iso
       umount /media/VBoxGuestAdditions
       rmdir /media/VBoxGuestAdditions
       yum clean all
       #curl -L https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub > /home/vagrant/.ssh/authorized_keys
       #chmod 0600 /home/vagrant/.ssh/authorized_keys
       #chown -R vagrant /home/vagrant/.ssh
       dd if=/dev/zero of=/EMPTY bs=1M
       rm -f /EMPTY
     SHELL
  end

  config.vm.define "fedora" do |node|
    node.vm.box = "fedora/26-cloud-base"
    node.vm.provision "shell", inline: <<-SHELL
      sed -i s/^#baseurl/baseurl/g /etc/yum.repos.d/fedora.repo
      sed -i s/^metalink/#metalink/g /etc/yum.repos.d/fedora.repo
      sed -i s+download.fedoraproject.org+192.168.1.15+g /etc/yum.repos.d/fedora.repo
      sed -i s/^#baseurl/baseurl/g /etc/yum.repos.d/fedora-updates.repo
      sed -i s/^metalink/#metalink/g /etc/yum.repos.d/fedora-updates.repo
      sed -i s+download.fedoraproject.org+192.168.1.15+g /etc/yum.repos.d/fedora-updates.repo
      dnf clean all
      dnf update -y
      dnf install gcc kernel-devel kernel-headers dkms make bzip2 perl -y
    SHELL
    node.vm.provision :reload 
    node.vm.provision "shell", inline: <<-SHELL
      curl -OL http://download.virtualbox.org/virtualbox/5.1.28/VBoxGuestAdditions_5.1.28.iso
      mkdir -p /media/VBoxGuestAdditions
      mount -o loop,ro VBoxGuestAdditions_5.1.28.iso /media/VBoxGuestAdditions
      sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
      rm VBoxGuestAdditions_5.1.28.iso
      umount /media/VBoxGuestAdditions
      rmdir /media/VBoxGuestAdditions
      dnf clean all
      #curl -L https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub > /home/vagrant/.ssh/authorized_keys
      #chmod 0600 /home/vagrant/.ssh/authorized_keys
      #chown -R vagrant /home/vagrant/.ssh
      dd if=/dev/zero of=/EMPTY bs=1M
      rm -f /EMPTY
     SHELL
  end
end

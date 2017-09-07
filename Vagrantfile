# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider :vmare_fusion do |vmware|
    vmware.vmx["ethernet0.pcislotnumber"] = "32"
  end
  
  config.vm.define "virtualbox" do |node|
    node.vm.provision "shell", inline: <<-SHELL
       sed -i s/^#baseurl/baseurl/g /etc/yum.repos.d/CentOS-Base.repo
       sed -i s/^mirror/#mirror/g /etc/yum.repos.d/CentOS-Base.repo
       sed -i s+mirror.centos.org+192.168.1.15/pub+g /etc/yum.repos.d/CentOS-Base.repo
       yum clean all
       yum install gcc kernel-devel kernel-headers dkms make bzip2 perl epel-release -y
       sed -i s/^#baseurl/baseurl/g /etc/yum.repos.d/epel.repo
       sed -i s/^mirror/#mirror/g /etc/yum.repos.d/epel.repo
       sed -i s+download.fedoraproject.org+192.168.1.15+g /etc/yum.repos.d/epel.repo
       curl -OL http://download.virtualbox.org/virtualbox/5.1.26/VBoxGuestAdditions_5.1.26.iso
       mkdir -p /media/VBoxGuestAdditions
       mount -o loop,ro VBoxGuestAdditions_5.1.26.iso /media/VBoxGuestAdditions
       sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
       rm VBoxGuestAdditions_5.1.26.iso
       umount /media/VBoxGuestAdditions
       rmdir /media/VBoxGuestAdditions
       yum clean all
       dd if=/dev/zero of=/EMPTY bs=1M
       rm -f /EMPTY
     SHELL
  end
  
  config.vm.define "vmware" do |node|
     node.vm.provision "shell", inline: <<-SHELL
       sed -i s/^#baseurl/baseurl/g /etc/yum.repos.d/CentOS-Base.repo
       sed -i s/^mirror/#mirror/g /etc/yum.repos.d/CentOS-Base.repo
       sed -i s+mirror.centos.org+192.168.1.15/pub+g /etc/yum.repos.d/CentOS-Base.repo
       yum clean all
       yum install epel-release open-vm-tools -y
       sed -i s/^#baseurl/baseurl/g /etc/yum.repos.d/epel.repo
       sed -i s/^mirror/#mirror/g /etc/yum.repos.d/epel.repo
       sed -i s+download.fedoraproject.org+192.168.1.15+g /etc/yum.repos.d/epel.repo
       yum clean all
       dd if=/dev/zero of=/EMPTY bs=1M
       rm -f /EMPTY
     SHELL
  end
end

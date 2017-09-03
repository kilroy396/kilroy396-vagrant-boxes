# Steps to used to create the vagrant image https://app.vagrantup.com/kilroy396/boxes/centos7-w using virtualbox

* This build localise the repo source, and installs the VirtualBox Guest Extensions *

1. Use the Vagrant file to start a current centos/7 virtualbox machine

2. go to http://download.virtualbox.org/virtualbox/ and identify the latest 5.1 virtualbox build

3. run the following commands; substituting the latest 5.1 virutal box iso

sudo sed -i s/^#baseurl/baseurl/g /etc/yum.repos.d/CentOS-Base.repo
sudo sed -i s/^mirror/#mirror/g /etc/yum.repos.d/CentOS-Base.repo
sudo sed -i s+mirror.centos.org+192.168.1.199/pub+g /etc/yum.repos.d/CentOS-Base.repo
sudo curl -OL http://download.virtualbox.org/virtualbox/5.1.26/VBoxGuestAdditions_5.1.26.iso
sudo mkdir -p /media/VBoxGuestAdditions
sudo mount -o loop,ro VBoxGuestAdditions_5.1.26.iso /media/VBoxGuestAdditions
sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
sudo rm VBoxGuestAdditions_5.1.26.iso
sudo umount /media/VBoxGuestAdditions
sudo rmdir /media/VBoxGuestAdditions
sudo yum clean all
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
cat /dev/null > ~/.bash_history && history -c && exit

4. run the following vagrant command to package the running machine

vagrant package --output kilroy396-centos7.box

5. upload the image to Vagrant Cloud

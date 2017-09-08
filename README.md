## This reoi was used to create the vagrant images that are found at https://app.vagrantup.com/kilroy396

*This repo is used to build either CentOS or Fedora vagrant boxes from the centos/7 and fedora/26-cloud-base images on Vagrant Cloud.  The build localise the repo source, and installs the VirtualBox Guest Extensions.  In the case of CentOS, it also enables the epel-release package and localises the source.*

To use the repo, undertake the following steps:
1. Go to http://download.virtualbox.org/virtualbox/ and identify the latest Guest Additions to install.

2. If necessary edit the Vagrantfile to use the latest guest additons.  Verify the correct local repo settings also.

3. Ensure that you have installed the vagrant-reload plugin installed.    Otherwise: `vagrant plugin install vagrant-reload`

4. Use the Vagrant file to start either a Centos or Fedora virtualbox machine, with an appropriate provier e.g. `vagrant up vmware-centos --provider vmware_fusion` to create the targate box.

6. Run the appropriate vagrant packaging to command for your operating system and provier e.g. `vagrant package virtualbox-centos --output someones-centos7.box`

7. upload the image to Vagrant Cloud, or use it locally via `vagrant box add someones-centos7 someones-centos7.box`

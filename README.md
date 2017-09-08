## This repo was used to create the vagrant images that are found at https://app.vagrantup.com/kilroy396

*This repo is used to build either CentOS or Fedora vagrant boxes from the centos/7 and fedora/26-cloud-base images on Vagrant Cloud.  The build localise the repo source, and installs the VirtualBox Guest Extensions.  In the case of CentOS, it also enables the epel-release package and localises the repositories source.*

To use the repo, undertake the following steps:
1. If you are using virtualbox, go to http://download.virtualbox.org/virtualbox/ and identify the latest Guest Additions to install.  If necessary edit the Vagrantfile to use the latest guest additons.

2. Verify the correct local repo settings.

3. Ensure that you have installed the vagrant-reload plugin installed.    Otherwise: `vagrant plugin install vagrant-reload`.  This is used incase we have a mismatch between the active kernel and the kernel headers.  It just depends on where we are at with the initial box images and the state of play for updates.

4. Use the Vagrant file to start either a Centos or Fedora virtualbox machine, with an appropriate provier e.g. `vagrant up vmware-centos --provider vmware_fusion` to create the target box.

6. Run the appropriate vagrant packaging to command for your operating system and provier e.g. `vagrant package virtualbox-centos --output someones-centos7.box`

7. upload the image to Vagrant Cloud, or use it locally via `vagrant box add someones-centos7 someones-centos7.box`

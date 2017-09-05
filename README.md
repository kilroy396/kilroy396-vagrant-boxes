# Steps to used to create the vagrant image https://app.vagrantup.com/kilroy396/boxes/centos7-w using virtualbox

* This build localise the repo source, and installs the VirtualBox Guest Extensions *

1. Use the Vagrant file to start a current centos/7 virtualbox machine

2. go to http://download.virtualbox.org/virtualbox/ and identify the latest Guest Additions to install.

3. If necessary edit the Vagrantfile to use the latest guest additons.  Verify the correct local repo settings also.

4. Run `vagrant up --provider virtualbox` to create the target box.

5. Run the following vagrant command to package the running machine

vagrant package --output kilroy396-centos7.box

6. upload the image to Vagrant Cloud

aside: this is a good example of a .gitignore file in action

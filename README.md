Provision
=========

A repository for Vagrant / Chef provision scripts.

### Directory Structure
```
.
|
|----- boxes  ( Box specific configuration such as a Vagantfile. )
|
|----- vagrant ( Contains files related to provisioning a new server.  Such as Chef scripts. )
```

### Installation

* Install Vagrant ( http://www.vagrantup.com/downloads.html )
* Install VirtualBox ( https://www.virtualbox.org/wiki/Downloads )

* Checkout provisioning source
```
git clone git@github.com:jeff-blaisdell/provision.git
cd provision/
cd boxes/kaleido
```
* Add a VM ( example below is Ubuntu 12.04 LTS)
```
vagrant box add precise64 http://files.vagrantup.com/precise64.box
```

* Startup Vagrant
```
vagrant up
```

### Boxes
* kaleido
    Box for kaleido.io website.  Grails / MySql
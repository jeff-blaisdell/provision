Provision
=========

A repository for Vagrant / Chef provision scripts.

### Directory Structure
```
.
|
|----- sites  ( Site specific configuration such as a Vagantfile. )
|
|----- vagrant ( Contains files related to provision a new server.  Such as Chef scripts. )
```

### Installation

* Install Vagrant ( http://www.vagrantup.com/downloads.html )
* Install VirtualBox ( https://www.virtualbox.org/wiki/Downloads )

* Checkout provisioning source
```
git clone git@github.com:jeff-blaisdell/provision.git
cd provision/
cd sites/kaleido
```

* Startup Vagrant
```
vagrant up
```
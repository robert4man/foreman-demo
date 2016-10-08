# Foreman Hiera Demo

## Overview

This is a reference architecture for a Foreman/Hiera demo at Ohio Linux Fest.

## Requirements
* VirtualBox
* A working Vagrant environment
* Additional Vagrant Plugins you will need:
    * puppet
    * vagrant-puppet-install
    * vagrant-r10k
    * vagrant-hostmanager

## Usage

```
git clone https://github.com/robert4man/foreman-demo.git
cd foreman-demo
vagrant up master
# May need to run puppet a second time
vagrant master --provision
vagrant up client
vagrant ssh master
sudo su -
r10k deploy environment --puppetfile
```

You should be able to access the web interface for Foreman using
http://foreman.example.com with a user name of admin and a password
of demo

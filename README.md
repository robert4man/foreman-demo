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
vagrant up master --provider=virtualbox
```

You *may* need to run puppet a second time. If so then you will need to
bring the client up separately.
```
vagrant master --provision
vagrant up client --provider=virtualbox
```

Manually execute r10k:
```
vagrant ssh master "sudo r10k deploy environment --puppetfile --verbose"
```

You should be able to access the web interface for Foreman using
http://foreman.example.com with a user name of admin and a password
of demo

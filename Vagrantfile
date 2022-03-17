# -*- mode: ruby -*-
# vi: set ft=ruby :



require 'puppet'
require 'vagrant-puppet-install'
require 'vagrant-r10k'
require 'vagrant-hostmanager'

Vagrant.configure(2) do |config|

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024
    vb.destroy_unused_network_interfaces = true
  end

  # Foreman Master Node
  config.vm.define "master" do |master|
    master.r10k.puppet_dir = "puppet"
    master.r10k.puppetfile_path = "puppet/Puppetfile"
    master.r10k.module_path = "puppet/modules"
    master.vm.box = "puppetlabs/centos-7.2-64-nocm"
    master.vm.network "private_network", ip: "192.168.33.10"
    master.vm.hostname = "foreman.example.com"
    master.puppet_install.puppet_version = "3.8.6"
    master.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = ["puppet/modules"]
      puppet.options = ["--fileserverconfig=/vagrant/puppet/fileserver.conf"]
    end
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024
    vb.destroy_unused_network_interfaces = true
  end

  # Puppet Client Node
  config.vm.define "client" do |client|
    client.r10k.puppet_dir = "puppet"
    client.r10k.puppetfile_path = "puppet/Puppetfile"
    client.r10k.module_path = "puppet/modules"
    client.vm.box = "puppetlabs/centos-7.2-64-nocm"
    client.vm.network "private_network", ip: "192.168.33.17"
    client.vm.hostname = "client.example.com"
    client.puppet_install.puppet_version = "3.8.6"
    client.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = ["puppet/modules"]
      puppet.options = ["--fileserverconfig=/vagrant/puppet/fileserver.conf"]
    end
  end

end

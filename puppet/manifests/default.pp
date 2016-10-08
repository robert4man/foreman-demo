# Foreman Master Node
node 'foreman.example.com' {
  include '::epel'
  class { '::foreman':
    configure_epel_repo => false,
    admin_password      => 'demo',
    require             => Class['epel'],
  }
  class { '::puppet':
    version  => '3.8.6-1.el7',
    server   => true,
    autosign => true,
    require  => Class['epel'],
  }
  class { 'hiera':
    hierarchy => [
      'nodes/%{::clientcert}',
      'roles/%{roles}',
      'common',
    ],
    datadir   => '/etc/puppet/environments/%{environment}/hieradata',
  }
  include '::foreman_proxy'
  firewalld_service { 'foreman':
    ensure  => 'present',
    service => 'RH-Satellite-6',
    zone    => 'public',
  }
  class { 'r10k':
    remote => 'https://github.com/robert4man/foreman-controller.git',
  }
}

# Puppet Client Node
node 'client.example.com' {
  class { '::puppet':
    version      => '3.8.6-1.el7',
    puppetmaster => 'foreman.example.com',
  }
}

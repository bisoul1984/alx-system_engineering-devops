# This Puppet manifest installs Flask version 2.1.0 using pip3

class install_flask {
  package { 'python3-pip':
    ensure => installed,
  }

  exec { 'install flask':
    command => '/usr/bin/pip3 install Flask==2.1.0',
    unless  => '/usr/bin/pip3 freeze | grep Flask==2.1.0',
    require => Package['python3-pip'],
  }
}

include install_flask

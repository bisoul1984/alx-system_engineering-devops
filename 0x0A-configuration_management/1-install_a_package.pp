# Installs Flask version 2.1.0 using pip3

exec { 'update-pip':
  command => 'pip3 install --upgrade pip',
  path    => ['/bin', '/usr/bin'],
  unless  => 'pip3 list --outdated | grep pip',
}

package { 'python3-pip':
  ensure   => installed,
  require  => Exec['update-pip'],
}

exec { 'install-flask':
  command => 'pip3 install Flask==2.1.0',
  path    => ['/bin', '/usr/bin'],
  unless  => 'pip3 freeze | grep Flask==2.1.0',
  require => Package['python3-pip'],
}


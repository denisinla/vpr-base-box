# development.pp
class requirements {
  group { 'puppet': ensure => 'present', }
  exec { 'apt-update':
    command => '/usr/bin/apt-get -y update'
  }
  package {
    ['mysql-client', 'mysql-server', 'libmysqlclient-dev']: 
    ensure => 'installed', require => Exec['apt-update']
  }
}
class {'requirements':}
class install_core_packages {
  package { 'build-essential':
    ensure => 'installed',
    provider => 'apt'
  }
  package { 'git-core':
    ensure => 'installed',
    provider => 'apt'
  }
}
class { 'install_core_packages': }
class install_ruby {
  package { 'ruby1.9.3':
    ensure => 'installed',
    provider => 'apt'
  } 
  package { 'rails':
    ensure => 'installed',
    provider => 'gem'
  }
  package { 'bundler':
    ensure => 'installed',
    provider => 'gem'
  }
}
class { 'install_ruby': }
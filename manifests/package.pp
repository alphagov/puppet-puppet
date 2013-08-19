# == Class puppet::package
#
class puppet::package {
  $puppet_ensure = $::puppet::puppet_ensure
  $facter_ensure = $::puppet::facter_ensure

  package { 'facter':
    ensure => $facter_ensure,
  } ->
  package { 'puppet-common':
    ensure => $puppet_ensure,
  } ->
  package { 'puppet':
    ensure => $puppet_ensure,
  }
}

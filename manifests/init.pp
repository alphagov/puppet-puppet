# == Class: puppet
#
# Puppet module for managing puppet
#
# === Parameters
#
# [*puppet_ensure*]
#   String passed to package resource, can be used to specify version.
#   Default: 'present'
#
# [*facter_ensure*]
#   String passed to package resource, can be used to specify version.
#   Default: 'present'
#
class puppet (
  $puppet_ensure = 'present',
  $facter_ensure = 'present'
) {

  if ($::osfamily != 'Debian') {
    fail("${::operatingsystem} not supported")
  }

  include puppetlabs_apt

  anchor { 'puppet::begin': } ->
  class { 'puppet::package': } ->
  anchor { 'puppet::end': }

  Class['puppetlabs_apt'] -> Class['puppet::package']
}

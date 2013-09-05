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
# [*cron_ensure*]
#   String passed to cron resource to make sure that it is present or not
#   Default: 'absent'
#
# [*cron_command]
#   String passed to cron resource to configure the command that job runs
#   Default: undef
#
class puppet (
  $puppet_ensure = 'present',
  $facter_ensure = 'present',
  $cron_ensure = 'absent',
  $cron_command =  undef
) {

  if ($::osfamily != 'Debian') {
    fail("${::operatingsystem} not supported")
  }

  include puppetlabs_apt

  anchor { 'puppet::begin': } ->
  class { 'puppet::package': } ->
  class { 'puppet::cron': } ->
  anchor { 'puppet::end': }

  Class['puppetlabs_apt'] -> Class['puppet::package']
}

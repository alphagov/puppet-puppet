# == Class puppet::cron
#
# This class should not be called directly.
#
class puppet::cron {
  $cron_command = $::puppet::cron_command
  $cron_ensure = $::puppet::cron_ensure

  $minute_one = fqdn_rand(30)
  $minute_two = $minute_one + 30

  cron { 'puppet':
    ensure  => $cron_ensure,
    user    => 'root',
    minute  => [$minute_one, $minute_two],
    command => $cron_command,
  }
}

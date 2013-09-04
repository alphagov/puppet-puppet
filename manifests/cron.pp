# == Class puppet::cron
#

class puppet::cron(
) {
  $cron_command = $::puppet::cron_command
  $cron_ensure = $::puppet::cron_ensure
  $first = fqdn_rand(30)
  $second = $first + 30

  cron { 'puppet':
    ensure  => $cron_ensure,
    user    => 'root',
    minute  => [$first, $second],
    command => $cron_command,
  }
}

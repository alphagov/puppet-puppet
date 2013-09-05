# puppet

Manages the installation of Puppet and it's dependencies from the official
Debian packages. Optionally, it can also setup a cronjob to run Puppet every
30 minutes.

Only supports Puppet 3.x and later due to bugs in `fqdn_rand()`.

## Example usage

Include with default parameters:
```
include puppet
```

## License

See [LICENSE](LICENSE) file.

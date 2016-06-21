# == Class: fabio
#
# This module is kind of a work in progress only contemplates that the config
# file exists with the desired values.
#
#
class fabio (
  $config_hash                   = {},
  $consul_addr                   = 'localhost:8500',
  $consul_token                  = 'CONSUL_TOKEN',
  $consul_kvpath                 = '/fabio/config',
  $consul_tagprefix              = 'urlprefix-',
  $consul_register_enabled       = false,
  $consul_register_addr          = ':9998',
  $consul_register_name          = 'fabio',
  $consul_register_tags          = 'mytag',
  $consul_register_checkinterval = '1s',
  $consul_register_checktimeout  = '3s',
  $proxy_addr                    = [],
  $header_clientip               = $::ipaddress,
  $header_tls                    = 'fabio',
  $header_tls_value              = '',
  $registry_static_routes        = [],
  $registry_file_path            = '',
  ){

  $listen_proxy_addr = join($proxy_addr, ',')

  file { '/etc/fabio':
    ensure  => 'directory',
    mode    => '0750',
    owner   => 'root',
    group   => 'root',
    purge   => true,
    recurse => true
  }

  file { '/etc/fabio/fabio.properties':
    ensure  => 'file',
    mode    => '0444',
    group   => 'root',
    owner   => 'root',
    content => template('fabio/etc/fabio/fabio.properties.erb'),
  }

}


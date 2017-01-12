#
class kibana5::config {
  $kibana5::config.keys.sort.each |$key| {
    yaml_setting {"kibana_config::${key}":
      target => '/etc/kibana/kibana.yml',
      key    => $key,
      value  => $kibana5::config[$key],
      notify => Service[$kibana5::service_name]
    }
  }
}

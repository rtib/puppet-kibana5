#
class kibana5::config {
  $kibana5::config.keys.sort.each |$key| {
    if is_array($kibana5::config[$key]) {
      $value_type = 'array'
    } elsif is_hash($kibana5::config[$key]) {
      $value_type = 'hash'
    } elsif is_integer($kibana5::config[$key]) { # ToDo: fix type for bignum
      $value_type = 'integer'
    } else {
      $value_type = undef
    }

    yaml_setting {"kibana_config::${key}":
      target => '/etc/kibana/kibana.yml',
      key    => $key,
      value  => $kibana5::config[$key],
      type   => $value_type,
    }
  }
}

#
class kibana5::service {
  $service_ensure = $kibana5::ensure ? {
    /absent/ => 'stopped',
    default  => 'running',
  }
  $service_enable = $kibana5::ensure ? {
    /absent/ => false,
    default  => true,
  }

  service { $kibana5::service_name:
    ensure     => $service_ensure,
    enable     => $service_enable,
    hasstatus  => true,
    hasrestart => true,
  }
}

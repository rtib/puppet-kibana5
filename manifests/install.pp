#
class kibana5::install {
  $package_ensure = $kibana5::ensure ? {
    /absent/ => 'purged',
    default  => $kibana5::package_version
  }

  package { $kibana5::package_name:
    ensure => $package_ensure,
  }
}
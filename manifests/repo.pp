#
class kibana5::repo {
  if $kibana5::manage_repo {
    include apt
    apt::key { 'elasticsearch-kibana5':
      ensure => $kibana5::ensure,
      id     => $kibana5::repository['key']['id'],
      source => $kibana5::repository['key']['source'],
    }
    apt::source { 'elasticsearch-kibana5':
      ensure   => $kibana5::ensure,
      location => $kibana5::repository['location'],
      release  => $kibana5::repository['release'],
      repos    => $kibana5::repository['repos']
    }
  }
}

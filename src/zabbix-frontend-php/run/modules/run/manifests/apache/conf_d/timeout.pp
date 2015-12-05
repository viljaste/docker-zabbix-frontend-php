class run::apache::conf_d::timeout {
  file { '/etc/apache2/conf.d/timeout':
    ensure => present,
    content => template('run/timeout.erb'),
    mode => 644
  }
}

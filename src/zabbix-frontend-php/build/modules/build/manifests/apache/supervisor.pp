class build::apache::supervisor {
  file { '/etc/supervisor/conf.d/apache.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/supervisor/conf.d/apache.conf',
    mode => 644
  }
}

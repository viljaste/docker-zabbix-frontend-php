class build::zabbix_frontend_php::supervisor {
  file { '/etc/supervisor/conf.d/zabbix_frontend_php.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/supervisor/conf.d/zabbix_frontend_php.conf',
    mode => 644
  }

  file { '/etc/supervisor/conf.d/zabbix_frontend_php_stdout.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/supervisor/conf.d/zabbix_frontend_php_stdout.conf',
    mode => 644
  }
}

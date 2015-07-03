class build::zabbix_web::supervisor {
  file { '/etc/supervisor/conf.d/zabbix_web.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/supervisor/conf.d/zabbix_web.conf',
    mode => 644
  }

  file { '/etc/supervisor/conf.d/zabbix_web_stdout.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/supervisor/conf.d/zabbix_web_stdout.conf',
    mode => 644
  }
}

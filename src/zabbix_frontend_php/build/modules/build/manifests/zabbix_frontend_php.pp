class build::zabbix_frontend_php {
  require build::zabbix_frontend_php::packages
  require build::zabbix_frontend_php::supervisor

  file { '/etc/apache2/conf.d/zabbix':
    ensure => present,
    source => 'puppet:///modules/build/etc/apache2/conf.d/zabbix',
    mode => 644
  }
}

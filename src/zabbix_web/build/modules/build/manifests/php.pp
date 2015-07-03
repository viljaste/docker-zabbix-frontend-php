class zabbix_web::php {
  require zabbix_web::php::packages

  file { '/etc/php5/apache2/php.ini':
    ensure => present,
    source => 'puppet:///modules/zabbix_web/etc/php5/apache2/php.ini',
    mode => 644
  }
}

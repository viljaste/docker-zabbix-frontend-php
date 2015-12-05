class run::zabbix_frontend_php {
  file { '/etc/zabbix/web/zabbix.conf.php':
    ensure => present,
    content => template('run/zabbix.conf.php.erb'),
    mode => 644
  }
}

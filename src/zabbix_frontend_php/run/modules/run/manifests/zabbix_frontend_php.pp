class run::zabbix_frontend_php {
  file { '/etc/zabbix/web/zabbix.conf.php':
    ensure => present,
    content => template('run/zabbix.conf.php.erb'),
    mode => 644
  }

  file { '/etc/apache2/sites-available/zabbix':
    ensure => present,
    content => template('run/zabbix.erb'),
    mode => 644
  }

  file { '/etc/apache2/sites-enabled/zabbix':
    ensure => link,
    target => '/etc/apache2/sites-available/zabbix',
    require => File['/etc/apache2/sites-available/zabbix']
  }
}

class run::php::ini::timezone {
  file { '/etc/php5/apache2/conf.d/timezone.ini':
    ensure => present,
    content => template('run/php/ini/timezone.ini.erb'),
    mode => 644
  }
}

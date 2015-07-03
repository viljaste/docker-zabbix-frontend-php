class run::php::ini::timezone {
  file { '/etc/php5/conf.d/timezone.ini':
    ensure => present,
    content => template('run/php/ini/timezone.ini.erb'),
    mode => 644
  }

  file { '//etc/php5/mods-available/timezone.ini':
    ensure => link,
    target => '/etc/php5/conf.d/timezone.ini',
    require => File['/etc/php5/conf.d/timezone.ini']
  }
}

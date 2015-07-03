class build::php {
  require build::php::packages

  file { '/etc/php5/apache2/php.ini':
    ensure => present,
    source => 'puppet:///modules/build/etc/php5/apache2/php.ini',
    mode => 644
  }
}

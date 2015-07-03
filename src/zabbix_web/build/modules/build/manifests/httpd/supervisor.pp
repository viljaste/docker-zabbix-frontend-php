class zabbix_web::httpd::supervisor {
  file { '/etc/supervisor/conf.d/httpd.conf':
    ensure => present,
    source => 'puppet:///modules/zabbix_web/etc/supervisor/conf.d/httpd.conf',
    mode => 644
  }

  file { '/etc/supervisor/conf.d/httpd_stdout.conf':
    ensure => present,
    source => 'puppet:///modules/zabbix_web/etc/supervisor/conf.d/httpd_stdout.conf',
    mode => 644
  }

  file { '/etc/supervisor/conf.d/httpd_stderr.conf':
    ensure => present,
    source => 'puppet:///modules/zabbix_web/etc/supervisor/conf.d/httpd_stderr.conf',
    mode => 644
  }
}

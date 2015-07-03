class zabbix_web::httpd::packages {
  package {[
      'apache2'
    ]:
    ensure => present
  }
}

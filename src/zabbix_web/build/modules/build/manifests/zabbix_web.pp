class build::zabbix_web {
  require build::zabbix_web::packages
  require build::zabbix_web::supervisor
}

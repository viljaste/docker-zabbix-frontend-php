class build {
  include build::php
  include build::httpd
  include build::zabbix_web
}

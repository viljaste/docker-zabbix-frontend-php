class build {
  include build::php
  include build::apache
  include build::zabbix_frontend_php
  include build::openvpn
}

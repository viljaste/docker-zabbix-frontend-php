class run {
  include run::httpd
  include run::php
  include run::zabbix_frontend_php
}

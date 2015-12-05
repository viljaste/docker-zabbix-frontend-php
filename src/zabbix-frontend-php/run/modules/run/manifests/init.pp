class run {
  include run::apache
  include run::php
  include run::zabbix_frontend_php
  include run::timezone

  if $openvpn == "On" {
    include run::openvpn
  }
}

#!/usr/bin/env bash

case "${1}" in
  build)
    /bin/su - root -mc "apt-get update && /src/zabbix_server/build.sh && /src/zabbix_server/clean.sh"
    ;;
  run)
    /bin/su - root -mc "source /src/zabbix_server/variables.sh && /src/zabbix_server/run.sh"
    ;;
esac

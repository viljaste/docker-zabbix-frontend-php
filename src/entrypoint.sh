#!/usr/bin/env bash

case "${1}" in
  build)
    /bin/su - root -mc "apt-get update && /src/zabbix_frontend_php/build.sh && /src/zabbix_frontend_php/clean.sh"
    ;;
  run)
    /bin/su - root -mc "source /src/zabbix_frontend_php/variables.sh && /src/zabbix_frontend_php/run.sh"
    ;;
esac

#!/usr/bin/env bash

case "${1}" in
  build)
    /bin/su - root -mc "apt-get update && /src/zabbix-frontend-php/build.sh && /src/zabbix-frontend-php/clean.sh"
    ;;
  run)
    /bin/su - root -mc "source /src/zabbix-frontend-php/variables.sh && /src/zabbix-frontend-php/run.sh"
    ;;
esac

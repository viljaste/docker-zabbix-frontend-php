#!/usr/bin/env bash

puppet apply --modulepath=/src/zabbix_server/run/modules /src/zabbix_server/run/run.pp

supervisord -c /etc/supervisor/supervisord.conf

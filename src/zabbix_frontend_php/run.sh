#!/usr/bin/env bash

puppet apply --modulepath=/src/zabbix_frontend_php/run/modules /src/zabbix_frontend_php/run/run.pp

supervisord -c /etc/supervisor/supervisord.conf

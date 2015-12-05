#!/usr/bin/env bash

puppet apply --modulepath=/src/zabbix-frontend-php/run/modules /src/zabbix-frontend-php/run/run.pp

supervisord -c /etc/supervisor/supervisord.conf

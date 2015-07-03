class run::zabbix_server {
  file { '/etc/zabbix/zabbix_server.conf':
    ensure => present,
    content => template('run/zabbix_server.conf.erb'),
    mode => 644
  }

  bash_exec { 'sleep 10': }

  bash_exec { "mysql -h '$mysqld_host' -P '$mysqld_port' -uroot -proot -e 'CREATE DATABASE zabbix;'":
    require => Bash_exec['sleep 10']
  }

  bash_exec { "cat /usr/share/zabbix-server-mysql/schema.sql | mysql -h '$mysqld_host' -P '$mysqld_port' -uroot -proot zabbix":
    timeout => 0,
    require => Bash_exec["mysql -h '$mysqld_host' -P '$mysqld_port' -uroot -proot -e 'CREATE DATABASE zabbix;'"]
  }

  bash_exec { "cat /usr/share/zabbix-server-mysql/images.sql | mysql -h '$mysqld_host' -P '$mysqld_port' -uroot -proot zabbix":
    timeout => 0,
    require => Bash_exec["cat /usr/share/zabbix-server-mysql/schema.sql | mysql -h '$mysqld_host' -P '$mysqld_port' -uroot -proot zabbix"]
  }

  bash_exec { "cat /usr/share/zabbix-server-mysql/data.sql | mysql -h '$mysqld_host' -P '$mysqld_port' -uroot -proot zabbix":
    timeout => 0,
    require => Bash_exec["cat /usr/share/zabbix-server-mysql/images.sql | mysql -h '$mysqld_host' -P '$mysqld_port' -uroot -proot zabbix"]
  }
}

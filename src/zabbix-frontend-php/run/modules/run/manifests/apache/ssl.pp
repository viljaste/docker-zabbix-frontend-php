class run::apache::ssl {
  bash_exec { 'mkdir -p /zabbix_frontend_php/ssl': }

  bash_exec { 'mkdir -p /zabbix_frontend_php/ssl/private':
    require => Bash_exec['mkdir -p /zabbix_frontend_php/ssl']
  }

  bash_exec { 'mkdir -p /zabbix_frontend_php/ssl/certs':
    require => Bash_exec['mkdir -p /zabbix_frontend_php/ssl/private']
  }

  file { '/root/opensslCA.cnf':
    ensure => present,
    content => template('run/opensslCA.cnf.erb'),
    require => Bash_exec['mkdir -p /zabbix_frontend_php/ssl/certs']
  }

  bash_exec { 'openssl genrsa -out /zabbix_frontend_php/ssl/private/zabbix_frontend_phpCA.key 4096':
    timeout => 0,
    require => File['/root/opensslCA.cnf']
  }

  bash_exec { "openssl req -sha256 -x509 -new -days 3650 -extensions v3_ca -config /root/opensslCA.cnf -key /zabbix_frontend_php/ssl/private/zabbix_frontend_phpCA.key -out /zabbix_frontend_php/ssl/certs/zabbix_frontend_phpCA.crt":
    timeout => 0,
    require => Bash_exec['openssl genrsa -out /zabbix_frontend_php/ssl/private/zabbix_frontend_phpCA.key 4096']
  }

  bash_exec { 'openssl genrsa -out /zabbix_frontend_php/ssl/private/zabbix_frontend_php.key 4096':
    timeout => 0,
    require => Bash_exec["openssl req -sha256 -x509 -new -days 3650 -extensions v3_ca -config /root/opensslCA.cnf -key /zabbix_frontend_php/ssl/private/zabbix_frontend_phpCA.key -out /zabbix_frontend_php/ssl/certs/zabbix_frontend_phpCA.crt"]
  }

  file { '/root/openssl.cnf':
    ensure => present,
    content => template('run/openssl.cnf.erb'),
    require => Bash_exec['openssl genrsa -out /zabbix_frontend_php/ssl/private/zabbix_frontend_php.key 4096']
  }

  bash_exec { "openssl req -sha256 -new -config /root/openssl.cnf -key /zabbix_frontend_php/ssl/private/zabbix_frontend_php.key -out /zabbix_frontend_php/ssl/certs/zabbix_frontend_php.csr":
    timeout => 0,
    require => File['/root/openssl.cnf']
  }

  bash_exec { "openssl x509 -req -sha256 -CAcreateserial -days 3650 -extensions v3_req -extfile /root/opensslCA.cnf -in /zabbix_frontend_php/ssl/certs/zabbix_frontend_php.csr -CA /zabbix_frontend_php/ssl/certs/zabbix_frontend_phpCA.crt -CAkey /zabbix_frontend_php/ssl/private/zabbix_frontend_phpCA.key -out /zabbix_frontend_php/ssl/certs/zabbix_frontend_php.crt":
    timeout => 0,
    require => Bash_exec["openssl req -sha256 -new -config /root/openssl.cnf -key /zabbix_frontend_php/ssl/private/zabbix_frontend_php.key -out /zabbix_frontend_php/ssl/certs/zabbix_frontend_php.csr"]
  }
}

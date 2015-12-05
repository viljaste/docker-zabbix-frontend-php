# docker-zabbix-frontend-php

A Docker image for [Zabbix](http://www.zabbix.com/) Web Frontend. Also supports connecting to OpenVPN server.

## Run the container

    CONTAINER="mysql-data" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /mysql \
      --entrypoint /bin/echo \
      dockerizedrupal/mysql:1.1.0 "Data-only container for MySQL."

    CONTAINER="mysql" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      --volumes-from mysql-data \
      -d \
      dockerizedrupal/mysql:1.1.0

    CONTAINER="zabbix-server" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      --link mysql:mysql \
      -d \
      dockerizedrupal/zabbix-server:0.1.5

    CONTAINER="zabbix-frontend-php-data" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /zabbix_frontend_php \
      --entrypoint /bin/echo \
      dockerizedrupal/zabbix-frontend-php:0.1.4 "Data-only container for Zabbix Web Frontend."

    CONTAINER="zabbix-frontend-php" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from zabbix-frontend-php-data \
      --link zabbix-server:zabbix-server \
      -d \
      dockerizedrupal/zabbix-frontend-php:0.1.4

## Build the image

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-zabbix-frontend-php.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 0.1.4 \
      && sudo docker build -t dockerizedrupal/zabbix-frontend-php:0.1.4 . \
      && cd -
      
## Changing the container behaviour on runtime through environment variables

    // TODO

## License

**MIT**

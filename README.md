# docker-zabbix-frontend-php

A [Docker](https://docker.com/) image for [Zabbix](http://www.zabbix.com/) web frontend.

## Run the container

Using the `docker` command:

    CONTAINER="zabbixfrontendphp" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      -e SERVER_NAME="localhost" \
      -e PROTOCOLS="https,http" \
      -e PHP_INI_TIMEZONE="UTC" \
      -d \
      viljaste/zabbix_frontend_php:2.2

Using the `docker-compose` command

    TMP="$(mktemp -d)" \
      && GIT_SSL_NO_VERIFY=true git clone https://git.beyondcloud.io/viljaste/docker-zabbix-frontend-php.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 2.2 \
      && sudo docker-compose up

## Build the image

    TMP="$(mktemp -d)" \
      && GIT_SSL_NO_VERIFY=true git clone https://git.beyondcloud.io/viljaste/docker-zabbix-frontend-php.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 2.2 \
      && sudo docker build -t viljaste/zabbix_frontend_php:2.2 . \
      && cd -
      
## License

**MIT**

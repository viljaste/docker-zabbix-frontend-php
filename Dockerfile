FROM viljaste/base:debian-wheezy

MAINTAINER Jürgen Viljaste <j.viljaste@gmail.com>

ENV TERM xterm

ADD ./src /src

RUN /src/entrypoint.sh build

EXPOSE 10051

ENTRYPOINT ["/src/entrypoint.sh", "run"]

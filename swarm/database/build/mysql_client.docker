FROM debian:12.1-slim

RUN apt-get -y update
RUN apt install -y curl gnupg2 lsb-release

RUN curl -O https://repo.percona.com/apt/percona-release_latest.generic_all.deb
RUN apt install -y ./percona-release_latest.generic_all.deb

RUN apt-get -y update
RUN percona-release setup ps80
RUN apt install -y percona-server-client
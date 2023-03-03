FROM debian:bullseye

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive \
	apt-get install -y --no-install-recommends pdns-server=4.4.1-1 pdns-backend-pgsql=4.4.1-1  \
	&& rm -rf /etc/powerdns/pdns.d/* /var/lib/apt/lists/*

COPY pdns.conf /etc/powerdns/
COPY init /sbin/

EXPOSE 53/tcp 53/udp

ENTRYPOINT ["/sbin/init"]

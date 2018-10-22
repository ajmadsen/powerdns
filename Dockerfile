# Stick to libressl 2.6
# https://github.com/PowerDNS/pdns/issues/6943
FROM debian:stretch

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive \
	   apt-get install -y --no-install-recommends pdns-server pdns-backend-pgsql \
	&& mkdir /etc/powerdns/pdns.docker.d \
	&& rm -rf /var/lib/apt/lists/*

ADD pdns.conf /etc/powerdns/
ADD init /sbin/

EXPOSE 53/tcp 53/udp
LABEL org.discourse.service._domain.port=53 org.discourse.service._domain.protocol=both

ENTRYPOINT ["/sbin/init"]

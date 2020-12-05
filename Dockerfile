FROM debian:bullseye

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive \
	   apt-get install -y --no-install-recommends pdns-server pdns-backend-pgsql \
	&& rm -rf /etc/powerdns/pdns.d/* /var/lib/apt/lists/*

ADD pdns.conf /etc/powerdns/
ADD init /sbin/

EXPOSE 53/tcp 53/udp

ENTRYPOINT ["/sbin/init"]

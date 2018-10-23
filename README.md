This is a PostgreSQL-enabled PowerDNS docker container, built specifically for
the needs of Discourse.  It may or may not be generally useful.

It was based on [a MySQL-targeted docker build by psi-4ward](https://github.com/psi-4ward/docker-powerdns),
however it has diverged significantly.

# Usage

Run it just like any other container, using environment variables to point it
at a PostgreSQL server that has been loaded with [the standard PowerDNS
schema](https://doc.powerdns.com/authoritative/backends/generic-postgresql.html#default-schema),
or at least something vaguely resembling it.

For example:

    docker run --name powerdns \
      -e PGSQL_HOST=localhost \
      -e PGSQL_PORT=5432 \
      -e PGSQL_USERNAME=pdns \
      -e PGSQL_PASSWORD=pdns \
      -e PGSQL_DATABASE=pdns \
      discourse/powerdns

# Configuration

All behaviour of this image are controlled via environment variables.  All
are optional.

* **`PGSQL_HOST`** (default: `localhost`) -- a hostname, IP address, or *socket
  directory path* (if the given value begins with a `/`) that should be used to
  connect to PostgreSQL.

* **`PGSQL_PORT`** (default: `5432`) -- the port number to connect to.

* **`PGSQL_USERNAME`** (default: `pdns`) -- the username to use to authenticate
  to PostgreSQL.

* **`PGSQL_PASSWORD`** (default: random string) -- the password to use to
  authenticate to PostgreSQL.

* **`PGSQL_DATABASE`** (default: `pdns`) -- the name of the database to connect
  to on the PostgreSQL server.

* **`PGSQL_DNSSEC`** (default: `yes`) -- whether or not to enable DNSSEC on the
  backend.


## PowerDNS Configuration

If you have a need to configure PowerDNS in a particular way, you can mount
a configuration directory on `/etc/pdns/pdns.d` containing `.conf` files
with configuration directives.


## License

[GNU General Public License v2.0](https://github.com/PowerDNS/pdns/blob/master/COPYING) applyies to PowerDNS and all files in this repository.


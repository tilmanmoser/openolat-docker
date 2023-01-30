# OpenOLAT dockerized

Dockerized OpenOLAT instance with postgresql, athena-pdf and custom theme & certifications

## Configuration
**.env**
```
# .env
NGINX_PORT=1234
OLAT_VERSION=1717
DB_HOST=db
DB_PORT=5432
DB_NAME=openolat
DB_USER=openolat
DB_PASS=openolat
ATHENA_SECRET=geheim
```

**tomcat/openolat.local.properties**
*Refer to `tomcat/openolat.properties` for all options*
```
# tomcat/openolat.local.properties
db.source=jndi
db.jndi=java:comp/env/jdbc/openolatDS
db.vendor=postgresql
installation.dir=/opt/openolat
log.dir=/opt/openolat/logs
server.contextpath=/openolat
server.domainname=localhost
server.port=${NGINX_PORT}
server.port.ssl=0
smtp.host=disabled
tomcat.id=1
userdata.dir=/opt/openolat/olatdata
```

## Build
1. Download & extract OpenOlat `./getOlat.sh`
2. `docker compose pull && docker compose build`

## Run
1. `docker compose up -d`
2. http://localhost:${NGINX_PORT}

## Troubleshoot
Athena PDF does not work in local development - you must configure all services to run behind a proxy 
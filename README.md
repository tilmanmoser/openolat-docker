# OpenOLAT dockerized

Dockerized OpenOLAT instance with postgresql, athena-pdf and custom theme & certifications

## Configuration
**.env**
```
# .env
OLAT_PORT=8088
OLAT_VERSION=1717
DB_HOST=db
DB_PORT=5432
DB_NAME=openolat
DB_USER=openolat
DB_PASS=openolat
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
server.port=8088
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
2. Open http://localhost:8088

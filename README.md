# OpenOLAT dockerized

Dockerized OpenOLAT instance with postgresql, athena-pdf and custom theme & certifications

## Essential Configuration
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

**tomcat/olat.local.properties**
*Refer to `tomcat/olat.properties` for all possible options and defaults*
```
# tomcat/olat.local.properties
db.source=jndi
db.jndi=java:comp/env/jdbc/openolatDS
db.vendor=postgresql
installation.dir=/opt/openolat
log.dir=/opt/openolat/logs
server.contextpath=/openolat
server.domainname=<domain>
server.port=80
server.port.ssl=0
smtp.host=disabled
tomcat.id=1
userdata.dir=/opt/openolat/olatdata
```

## Fetch WAR and docker images
1. Download & extract OpenOlat `./getOlat.sh`
2. `docker compose pull`

## Run
1. `docker compose up -d`

## Nginx Proxy
OLAT_PORT and ATHENA_PORT is exposed to localhost only (not accessible from outside)
1. Replace ${OLAT_PORT} and ${ATHENA_PORT} in vhost.conf, set the server name to the domain configured in olat.local.properties and copy/link it to /etc/nginx/sites-enabled
2. (recommended) create a ssl cert (`certbot -d <domain>`)
3. Test nginx config (`nginx -t`)
4. Restart nginx (`service reload nginx`)


## Further Configurations

**Athena**
Athena PDF does not work in local development, since athena calls openolat to retrieve the certificate and localhost points to athena not the docker host machine.

Login as Administrator in Olat
Administration > Externe Werkzeuge > PDF Generator
- Enable
- Choose AthenaPDF
- URL = https://domain/_pdf
- Key = ${ATHENA_SECRECT}

**Office365 Mail**
Goto Office365 Admin-Center > Acive Users > <User> > E-Mail > E-Mail-Apps and enable *Authenticated SMTP*

Settings for `tomcat/olat.local.properties`:
```
# tomcat/olat.local.properties
# ...
smtp.host=smtp.office365.com
smtp.port=587
smtp.sslEnabled=false
smtp.sslCheckCertificate=false
smtp.starttls=true
smtp.user=email@example.com
smtp.pwd=password
#smtp.from= !! DO NOT SET SMTP.FROM !!
fromemail=email@example.com
```

**Microsoft Teams**
Create an Application in Azure AD + Secret
Grant these in Microsoft.Graph for Application (not delegated!) and acknowledge access as admin
- OnlineMeetingArtifact.Read.All
- OnlineMeetings.Read.All
- OnlineMeetings.ReadWrite.All
- Organization.Read.All
- Organization.ReadWrite.All
- User.ReadWrite.All

**BigBlueButton**
Configure with API_URL (domain/bigbluebutton) & API_SECRET
Capacity factor is only used in load balancer if you configure multiple servers
Set the max meeting duration for classroom to 720 minutes for whole day events

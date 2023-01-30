ARG DART_VERSION=1.57.1
ARG OLAT_VERSION=17.1.7

FROM --platform=linux/amd64 debian:buster-slim as build 
ARG DART_VERSION
ADD https://github.com/sass/dart-sass/releases/download/${DART_VERSION}/dart-sass-${DART_VERSION}-linux-x64.tar.gz /opt/
RUN tar -C /opt/ -xzvf /opt/dart-sass-${DART_VERSION}-linux-x64.tar.gz

FROM --platform=linux/amd64 debian:buster-slim as source
ARG OLAT_VERSION
ADD https://github.com/OpenOLAT/OpenOLAT/archive/refs/tags/OpenOLAT_${OLAT_VERSION}.tar.gz /opt/
RUN tar -C /opt/ -xzvf /opt/OpenOLAT_${OLAT_VERSION}.tar.gz
RUN mv /opt/OpenOLAT-OpenOLAT_${OLAT_VERSION} /opt/openolat

FROM --platform=linux/amd64 debian:buster-slim as runner
COPY --from=build /opt/dart-sass /opt/dart-sass
ENV PATH="$PATH:/opt/dart-sass"
COPY --from=source /opt/openolat /opt/openolat

WORKDIR /opt/openolat/src/main/webapp/static/themes

CMD ["./compiletheme.sh", "-f", "impavit"]


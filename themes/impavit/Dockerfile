ARG DART_VERSION=1.57.1
ARG OLAT_VERSION=17.1.7

FROM debian:buster-slim as build
ARG DART_VERSION
ARG OLAT_VERSION
ADD https://github.com/sass/dart-sass/releases/download/${DART_VERSION}/dart-sass-${DART_VERSION}-linux-x64.tar.gz /opt/
RUN tar -C /opt/ -xzvf /opt/dart-sass-${DART_VERSION}-linux-x64.tar.gz

FROM debian:buster-slim as source
ADD https://github.com/OpenOLAT/OpenOLAT/archive/refs/tags/OpenOLAT_${OLAT_VERSION}.tar.gz /opt/
RUN tar -C /opt/ -xzvf /opt/OpenOLAT_${OLAT_VERSION}.tar.gz

FROM debian:buster-slim as runner
COPY --from=build /opt/dart-sass /opt/dart-sass
COPY --from=source /opt/OpenOLAT-OpenOLAT_${OLAT_VERSION} /opt/openolat
WORKDIR /opt/openolat/src/main/webapp/static/themes
COPY ./themes/* .

CMD ["./compiletheme.sh"]


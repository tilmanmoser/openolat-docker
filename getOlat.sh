#!/usr/bin/env bash

if [ -f .env ]; then
  export $(echo $(cat .env | sed 's/#.*//g'| xargs) | envsubst)
fi

OLATDIR="${PWD}/openolat"

function getOlatVersion() {
  ## download
  mkdir -p ${OLATDIR}
  if [ ! -f "${OLATDIR}/openolat_${OLAT_VERSION}.war" ]; then
    curl "https://www.openolat.com/releases/openolat_${OLAT_VERSION}.war" --output "${OLATDIR}/openolat_${OLAT_VERSION}.war" --silent
  fi

  ## unzip
  mkdir -p "${OLATDIR}/openolat_${OLAT_VERSION}"
  unzip -qq  "${OLATDIR}/openolat_${OLAT_VERSION}.war" -d "${OLATDIR}/openolat_${OLAT_VERSION}"
}

getOlatVersion

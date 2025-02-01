#!/bin/bash
#
# Author  : Gaston Gonzalez
# Date    : 20 January 2025
# Updated : 1 February 2025
# Purpose : Install VARA Terminal
set -e

source ./common-checks.sh

VERSION="1.2.2"
DOWNLOAD_FILE="vara-terminal-${VERSION}.zip"
URL="https://downloads.winlink.org/VARA%20Products/VARA%20Terminal%20V${VERSION}%20setup.zip"

et-log "Installing VARA Terminal..."

if [ ! -e ${DOWNLOAD_FILE} ]; then
  et-log "Downloading VARA Terminal ${version} from ${URL}"
  curl -s -f -L -o ${DOWNLOAD_FILE} "${URL}"
fi 

if [ $? -ne 0 ]; then
  et-log "Error downloading VARA Terminal ${VERSION}."
  exit 1
fi

unzip -o ${DOWNLOAD_FILE}

wine 'VARA Terminal setup (Run as Administrator).exe'

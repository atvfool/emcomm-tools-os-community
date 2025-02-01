#!/bin/bash
#
# Author  : Gaston Gonzalez
# Date    : 20 January 2025
# Updated : 1 February 2025
# Purpose : Install VARA HF
set -e

source ./common-checks.sh

VERSION="4.8.9"
DOWNLOAD_FILE="vara-hf-${VERSION}.zip"
URL="https://downloads.winlink.org/VARA%20Products/VARA%20HF%20v${VERSION}%20setup.zip"
VARA_HOME="${HOME}/.wine32/drive_c/VARA"

et-log "Installing VARA HF..."

if [ ! -e ${DOWNLOAD_FILE} ]; then
  et-log "Downloading VARA HF ${version} from ${URL}"
  curl -s -f -L -o ${DOWNLOAD_FILE} "${URL}"
fi 

if [ $? -ne 0 ]; then
  et-log "Error downloading VARA HF ${VERSION}."
  exit 1
fi

unzip -o ${DOWNLOAD_FILE}

wine 'VARA setup (Run as Administrator).exe'

if [ ! -e "${VARA_HOME}/nt4pdhdll.exe" ]; then
  et-log "Install missing DLL..."

  CWD=$(pwd)

  cd ${VARA_HOME}
  curl -s -f -L -O \
    http://download.microsoft.com/download/winntsrv40/update/5.0.2195.2668/nt4/en-us/nt4pdhdll.exe && unzip nt4pdhdll.exe
  cd ${CWD}
fi

#!/bin/bash
# Author    : Andrew Hayden
# Date      : 26 March 2025
# Purpose   : Install WSJTX
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'et-log "\"${last_command}\" command failed with exit code $?."' ERR

. ./env.sh

VERSION="2.7.0"
FILE="wsjtx_${VERSION}_amd64.deb"
URL="https://sourceforge.net/projects/wsjt/files/wsjtx-${VERSION}/${FILE}"

et-log "Installing WSJTX dependencies..."
apt install \
  libgfortran5 \
  libqt5widgets5 \
  libqt5network5 \
  libqt5printsupport5 \
  libqt5multimedia5-plugins \
  libqt5serialport5 \
  libqt5sql5-sqlite \
  libfftw3-single3 \
  libgomp1 \
  libboost-all-dev \
  libusb-1.0-0 libportaudio2 \
  -y

if [ ! -e $ET_DIST_DIR/$FILE ]; then
  et-log "Downloading WSJTX: $URL"

  curl -s -L -O --fail $URL

  [ ! -e $ET_DIST_DIR ] && mkdir -v $ET_DIST_DIR

  mv -v $FILE $ET_DIST_DIR
else
  et-log "${FILE} already downloaded. Skipping..."
fi

dpkg -i $ET_DIST_DIR/$FILE

sudo apt -f install -y

et-log "Updating JS8Call launcher icon to support PNP..."

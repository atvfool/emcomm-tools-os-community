#!/bin/bash
# Author  : Gaston Gonzalez
# Date    : 27 March 2023
# Purpose : Install packet packages
set -e

et-log "Installing AX.25 packages..."
apt install \
  ax25-tools \
  ax25-apps \
  -y

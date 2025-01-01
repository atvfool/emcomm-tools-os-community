#!/bin/bash
# Author  : Gaston Gonzalez
# Date    : 27 March 2023
# Updated : 1 January 2025
# Purpose : Install packet packages
set -e

et-log "Installing AX.25 packages..."
apt install \
  ax25-tools \
  ax25-apps \
  -y

et-log "Installing rfcomm sudoers rules..."
cp -v ../overlay/etc/sudoers.d/* /etc/sudoers.d/


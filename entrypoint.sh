#!/bin/sh

( [ ! -f /root/bin/pass ] || ( echo "There is already a file there." && exit 64 )) &&
  ( [ ! -d /root/bin/pass ] || ( echo "There is already a directory there." && exit 65 )) &&
  ( [ ! -x /root/bin/pass ] || ( echo "There is already a device there." && exit 66 )) &&
  docker pull ${PASS_IMAGE} &&
  sed -e "s#\${PASS_IMAGE}#${PASS_IMAGE}#" /opt/docker/program.sh -e "w/root/bin/pass" &&
  chmod 0500 /root/bin/pass &&
  true

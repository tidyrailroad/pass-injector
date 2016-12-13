#!/bin/sh

apk update &&
  apk upgrade &&
  apk add docker &&
  rm -rf /opt/docker/run.sh &&
  true

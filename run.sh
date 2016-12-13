#!/bin/sh

apk update &&
  apk upgrade &&
  apk add docker &&
  apk add sed &&
  rm -rf /opt/docker/run.sh &&
  true

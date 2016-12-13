#!/bin/sh

docker \
  run \
  --interactive \
  --tty \
  --rm \
  ${PASS_IMAGE} \
  ${@} &&
  true

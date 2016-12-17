#!/bin/sh

docker \
  run \
  --interactive \
  --tty \
  --rm \
  --volume ${BIN}:/usr/local/bin:ro \
  --volume /var/run/docker.sock:/var/run/docker.sock:ro \
  ${PASS_IMAGE} \
  ${@} &&
  true

#!/bin/sh

docker \
  run \
  --interactive \
  --tty \
  --rm \
  --volume ${BIN}:/usr/local/bin:ro \
  --volume ${DOT_STORE}:/root/.password-store \
  --volume /var/run/docker.sock:/var/run/docker.sock:ro \
  ${PASS_IMAGE} \
  ${@} &&
  true

#!/bin/sh

DOT_GNUPG=${1} &&
    ( [ ! -f /root/bin/pass ] || ( echo "There is already a file there." && exit 64 )) &&
    ( [ ! -d /root/bin/pass ] || ( echo "There is already a directory there." && exit 65 )) &&
    ( [ ! -x /root/bin/pass ] || ( echo "There is already a device there." && exit 66 )) &&
    docker pull ${PASS_IMAGE} &&
    docker pull ${GPG_INJECTOR_IMAGE} &&
    BIN=$(docker volume create) &&
    docker \
	run \
	--interactive \
	--tty \
	--rm \
	--volume ${BIN}:/root/bin \
	--volume ${DOT_GNUPG}:/root/.gnupg \
	--volume /var/run/docker.sock:/var/run/docker.sock \
	${GPG_INJECTOR_IMAGE} &&
    sed \
	-e "s#\${PASS_IMAGE}#${PASS_IMAGE}#" \
	-e "s#\${BIN}#${BIN}#" \
	-e "w/root/bin/pass" \
	/opt/docker/program.sh &&
    chmod 0500 /root/bin/pass &&
    true

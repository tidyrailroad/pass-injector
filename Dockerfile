FROM alpine:3.4
MAINTAINER Emory Merryman emory.merryman@gmail.com
COPY run.sh entrypoint.sh program.sh /opt/docker/
RUN ["/bin/sh", "/opt/docker/run.sh"]
ENV PATH="/root/bin:${PATH}" PASS_IMAGE="emorymerryman/pass:0.4.0" GPG_INJECTOR_IMAGE="emorymerryman/gpg-injector:0.0.1"
ENTRYPOINT ["/bin/sh", "/opt/docker/entrypoint.sh"]
CMD ["dot_gnupg", "dot_store"]

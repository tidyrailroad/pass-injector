FROM alpine:3.4
MAINTAINER Emory Merryman emory.merryman@gmail.com
COPY run.sh entrypoint.sh program.sh /opt/docker/
ENV PASS_IMAGE=emorymerryman/pass:0.1.0
RUN ["/bin/sh", "/opt/docker/run.sh"]
ENTRYPOINT ["/bin/sh", "/opt/docker/entrypoint.sh"]
CMD []

FROM quay.io/justcontainers/base-alpine:v0.12.2
MAINTAINER tynor88 <tynor@hotmail.com>

RUN apk add --no-cache socat

COPY /root /

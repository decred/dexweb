# builder image
FROM alpine:latest

ENV HUGO_VERSION 0.82.1

LABEL description="gohugo build"
LABEL version="1.0"
LABEL maintainer="jholdstock@decred.org"

WORKDIR /tmp

RUN apk update && apk upgrade
RUN apk add --no-cache bash wget libc6-compat g++
RUN wget -q https://github.com/gohugoio/hugo/releases/download/v$HUGO_VERSION/hugo_extended_"$HUGO_VERSION"_Linux-64bit.tar.gz
RUN tar xz -C /usr/local/bin -f hugo_extended_"$HUGO_VERSION"_Linux-64bit.tar.gz

WORKDIR /root

COPY src/ /root/

RUN hugo

# Serve image (stable nginx version)
FROM nginx:1.20

LABEL description="dexweb server"
LABEL version="1.0"
LABEL maintainer="jholdstock@decred.org"

COPY conf/nginx.conf /etc/nginx/cof.d/default.conf

COPY --from=0 /root/public/ /usr/share/nginx/html

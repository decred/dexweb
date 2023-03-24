# Build image
FROM alpine:latest

ENV HUGO_VERSION 0.110.0

LABEL description="gohugo build"
LABEL version="1.0"
LABEL maintainer="jholdstock@decred.org"

WORKDIR /tmp

RUN apk update && apk upgrade
RUN apk add --no-cache bash wget libc6-compat g++
RUN wget -q https://github.com/gohugoio/hugo/releases/download/v$HUGO_VERSION/hugo_extended_"$HUGO_VERSION"_linux-amd64.tar.gz
RUN tar xz -C /usr/local/bin -f hugo_extended_"$HUGO_VERSION"_linux-amd64.tar.gz

WORKDIR /root

COPY src/ /root/

# Remove old hugo output before building
RUN rm -rf public resources

# Build site
RUN hugo --buildFuture

# Serve image (stable nginx version)
FROM nginx:1.22-alpine

LABEL description="dexweb server"
LABEL version="1.0"
LABEL maintainer="jholdstock@decred.org"

COPY conf/nginx.conf /etc/nginx/cof.d/default.conf

COPY --from=0 /root/public/ /usr/share/nginx/html

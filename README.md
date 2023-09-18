# dexweb

This is the code for the <https://dex.decred.org> website.

[![Build Status](https://github.com/decred/dexweb/actions/workflows/docker.yml/badge.svg)](https://github.com/decred/dexweb/actions/workflows/docker.yml)
[![ISC License](http://img.shields.io/badge/license-ISC-blue.svg)](http://copyfree.org)

## Development

1. Install [Hugo](https://gohugo.io/).

1. Start development web server

    ```sh
    bin/watch.sh
    ```

## Deployment

A Docker configuration is included for building the deployable images of dexweb.

1. Install docker.

1. Build the docker image for deployment

    ```sh
    bin/build.sh
    ```

1. Run the docker image `decred/dexweb`

    ```sh
    docker run -d -p <local port>:80 decred/dexweb:latest
    ```

## License

dexweb is licensed under the liberal ISC License.

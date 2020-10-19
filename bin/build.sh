#!/bin/bash -e
# Requires docker 17.05 or higher

echo ""
echo "================================="
echo "  Building dexweb docker image  "
echo "================================="
echo ""

docker build -t jholdstock/dexweb .

echo ""
echo "==================="
echo "  Build complete"
echo "==================="
echo ""
echo "You can now run dexweb with the following command:"
echo "    docker run -d --rm -p <local port>:80 jholdstock/dexweb:latest"
echo ""
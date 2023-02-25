#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/../../

docker pull ghcr.io/hanze-hbo-ict/openpilot-base-cl:latest
docker build \
  --cache-from ghcr.io/hanze-hbo-ict/openpilot-sim:latest \
  -t ghcr.io/hanze-hbo-ict/openpilot-sim:latest \
  -f tools/sim/Dockerfile.sim .

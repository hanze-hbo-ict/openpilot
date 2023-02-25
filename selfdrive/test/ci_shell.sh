#!/bin/bash -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
OP_ROOT="$DIR/../../"

if [ -z "$BUILD" ]; then
  docker pull ghcr.io/hanze-hbo-ict/openpilot-base:latest
else
  docker build --cache-from ghcr.io/hanze-hbo-ict/openpilot-base:latest -t ghcr.io/hanze-hbo-ict/openpilot-base:latest -f $OP_ROOT/Dockerfile.openpilot_base .
fi

docker run \
       -it \
       --rm \
       --volume $OP_ROOT:$OP_ROOT \
       --workdir $PWD \
       --env PYTHONPATH=$OP_ROOT \
       ghcr.io/hanze-hbo-ict/openpilot-base:latest \
       /bin/bash

#!/bin/bash

readonly SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"
readonly DATA_DIR=${SCRIPT_DIR}/pb_data

mkdir -p ${DATA_DIR}
docker run \
    --rm -p 8080:8080 \
    -v ${DATA_DIR}:/pb_data \
    -it $(docker build -q .)

#!/usr/bin/env bash

set -e

PATH=/usr/local/bin/:$PATH
BIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P)"

build_cmd="clean build"

cd $BIN_DIR
./gradlew $build_cmd

curl --user oraviv:$UPLOAD_PASS --upload-file build/scanns_2.11/libs/scanns_2.11-*.jar https://artifactory.paypalcorp.com/artifactory/art-snapshots/jars/

date
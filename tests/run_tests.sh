#!/bin/bash
set -e
set -x

export NODE_VERSION=${NODE_VERSION:-14.17.3}

bash ./build_it.sh

docker kill some-test-mongo || true
docker rm some-test-mongo || true
docker run --name some-test-mongo -d mongo:latest

bash ./test_meteor_app.sh
bash ./test_meteor_app_with_devbuild.sh

# I don't believe it's possible for this test to work right now.
# bash ./test_bundle_local_mount.sh

# These use BUNDLE_URL from S3
# bash ./test_bundle_web.sh
# bash ./test_binary_build_on_base.sh
# bash ./test_binary_build_on_bin_build.sh

bash ./test_phantomjs.sh
bash ./test_no_app.sh

bash ./test_sigterm.sh

#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e50727273c3be001ba724a4/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e50727273c3be001ba724a4
curl -s -X POST https://api.stackbit.com/project/5e50727273c3be001ba724a4/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e50727273c3be001ba724a4/webhook/build/publish > /dev/null

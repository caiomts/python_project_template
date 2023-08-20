#!/usr/bin/env bash

set -e
set -x

PREFIX=''

[[ -z "$GITHUB_ACTIONS" ]] && PREFIX='docker compose run --rm --no-deps python -m' 


${PREFIX} pytest -v --cov-fail-under=95 \
    --cov-config=.coveragerc \
    --cov-report \
    term-missing \
    --cov=project_name test/
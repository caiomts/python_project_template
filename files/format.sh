#!/usr/bin/env bash

set -x
set -e

PREFIX=''

[[ -z "$GITHUB_ACTIONS" ]] && PREFIX='docker compose run --rm --no-deps python -m' 

${PREFIX} ruff check .

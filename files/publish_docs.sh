#!/usr/bin/env bash

set -e

PREFIX=''

[[ -z "$GITHUB_ACTIONS" ]] && PREFIX='docker compose run --rm --no-deps python -m' 

${PREFIX} mkdocs gh-deploy --force

#!/usr/bin/env bash

set -x
set -e

PREFIX=''

[[ -z "$GITHUB_ACTIONS" ]] && PREFIX='docker compose run --rm --no-deps python -m' 

${PREFIX} black project_name/ test/
${PREFIX} isort project_name/ test/
${PREFIX} flake8 project_name/ test/
${PREFIX} pydocstyle project_name/

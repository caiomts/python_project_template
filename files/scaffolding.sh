#!/usr/bin/env bash

set -e
set -x

PREFIX=''

[[ ( -z "$DOCKER_BUILDKIT" ) && ( -z "$GITHUB_ACTIONS" )]] &&  PREFIX='.venv/bin/'

${PREFIX}python -m pip install --upgrade pip flit
${PREFIX}python -m flit install --symlink --deps all

#!/usr/bin/env bash

source scripts/scaffolding.sh


${PREFIX}python -m mkdocs gh-deploy --force

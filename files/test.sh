#!/usr/bin/env bash

source scripts/scaffolding.sh


${PREFIX}python -m pytest -v --cov-fail-under=95 \
    --cov-config=.coveragerc \
    --cov-report \
    term-missing \
    --cov=project_name test/
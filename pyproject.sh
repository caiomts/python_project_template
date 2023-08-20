#!/usr/bin/env bash

# Defining LC_ALL.
LC_ALL=C

# Error message.
error_msg[1]='This project already exists.'
error_msg[2]='Invalid name. Valid characters: [_0-9a-z]'

error() {
	echo ${error_msg[$1]}
	exit 1
}

# Project name.
[[ $# -ne 1 ]] && read -p 'Project name is missing: ' -t 20 project_name || project_name=$1

# Project already exist.
[[ -d $project_name ]] && error 1

# Invalid project name.
[[ $project_name =~ ^[_a-z0-9]+$ ]] || error 2

# config path
path_config=$HOME/.config/pyproject_template

# author
read -p 'Author name: ' -t 20 author
read -p 'Author email: ' -t 20 email
read -p 'License: ' -t 20 _license

# links license and gitignore
license="https://choosealicense.com/licenses/${_license}/#"

gitignore='https://www.toptal.com/developers/gitignore/api/python'

# folders
mkdir -p $project_name/{$project_name,docs,test,scripts,.github/workflows}

# README.md, __init__.py
touch $project_name/README.md
touch $project_name/test/__init__.py

echo 'import pytest' > $project_name/test/conftest.py

echo '"""Sort Description."""

__version__ = '0.1.0'' > $project_name/$project_name/__init__.py

# download license and .gitignore
curl -s -o $project_name/LICENSE $license
curl -s -o $project_name/.gitignore $gitignore

# copy files
cp $path_config/docker-compose.yml $project_name
cp $path_config/.flake8 $project_name
cp $path_config/Makefile $project_name
cp $path_config/*.sh $project_name/scripts


# pyproject.toml
sed "s/project_name/$project_name/g ; s/_author/$author/g ; s/@/$email/g" \
	$path_config/pyproject.toml > $project_name/pyproject.toml

# mkdocs
sed "s/project_name/$project_name/g" \
    $path_config/mkdocs.yml > $project_name/mkdocs.yml

# Dockerfile
sed "s/project_name/$project_name/g" \
    $path_config/Dockerfile > $project_name/Dockerfile

# format
sed "s/project_name/$project_name/g" \
    $path_config/format.sh > $project_name/scripts/format.sh

# tests
sed "s/project_name/$project_name/g" \
    $path_config/test.sh > $project_name/scripts/test.sh

# Git
cd $project_name && git init &> /dev/null && \
    sed "s/project_name/$project_name/g" \
        $path_config/pre-commit > .git/hooks/pre-commit && \
        chmod +x .git/hooks/pre-commit

echo "$project_name setup is done."




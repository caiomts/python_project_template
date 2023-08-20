# Python Project Template

Simple bash script to generate the python project template I use.

## Quick Start

### requirements:
- bash
- curl
- git

*Linux OS often have these requirements by default.*

### 1. Clone the repo

```
$ git clone
```

### 2. Create config folder
```
$ mkdir $HOME/.config/pyproject_template
```

### 3. Copy files to config folder
```
$ cp files/* $HOME/.config/pyproject_template
```

### 4. Run
```
$ . /path/to/the/script/pyproject.sh your_project_name
Author name: your name
Author email: your email
License: your license
your_project_name setup is done.
```
The next time you use the template, only the fourth step is needed.

## Template

.  
├── `.flake8`    
├── .git  
│   ├── ...  
│   ├── hooks  
│   │   ├── ...  
│   │   ├── `pre-commit`    
│   │   └── ...  
│   └── ...  
├── .github  
│   └── workflows  
├── `.gitignore`    
├── `Dockerfile`    
├── `LICENSE`    
├── `Makefile`    
├── `README.md`    
├── `docker-compose.yml`    
├── docs  
├── `mkdocs.yml`    
├── your_project_name   
│   └── `__init__.py`    
├── `pyproject.toml`    
├── scripts  
│   ├── `format.sh`    
│   ├── `preview_docs.sh`    
│   ├── `publish.sh`  
│   ├── `publish_docs.sh`    
│   └── `test.sh`      
└── test    
    ├── `__init__.py`      
    └── `conftest.py`    


The files are defined with basic settings and, when necessary, point to the correct project folder.

## How to use and template design

This template has a Docker container development environment and is designed to build CI/CD on GitHub Actions.

I use the GitHub [“Scripts to Rule Them All”](https://github.blog/2015-06-30-scripts-to-rule-them-all/) pattern. So there are basic scripts for the whole development process and these scripts must be called either locally or automatically in CI/CD. To call them locally, I use a Makefile to wrap all the commands together.

### Format
- black (config in pyproject.toml)
- isort (config in pyproject.toml)
- pydocstyle (config in pyproject.toml)
- flake8 (config in .flake8)

### tests
- pytest
- pytest-cov

### docs
- mkdocs-material

## TODO
- Actions workflows.


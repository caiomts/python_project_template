FROM python:3-slim-bullseye

RUN pip install --no-cache-dir --upgrade pip flit

ENV FLIT_ROOT_INSTALL=1

WORKDIR /src

COPY project_name/__init__.py /src/project_name/__init__.py

COPY README.md /src/README.md

COPY pyproject.toml /src/pyproject.toml

RUN flit install --symlink --deps all

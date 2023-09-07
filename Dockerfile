# Author: Colm Duffy
FROM jupyter/minimal-notebook:python-3.9.13

USER root

# Install curl needed for installing Poetry
RUN apt update --yes && \
  apt upgrade --yes && \
  apt install --yes --no-install-recommends \
  make \
  curl

USER ${NB_UID}

# Set your GitHub Personal Access Token here (ensure it is added to the repo)
ARG GIT_ACCESS_TOKEN

RUN git config --global url."https://${GIT_ACCESS_TOKEN}@github.com/".insteadOf "https://github.com/"

# Install goblin_lite package from the Git repository URL with authentication
RUN pip install "goblin_validation@git+https://github.com/colmduff/goblin_validation.git@main" 


ENV PATH="$HOME/.local/bin:${PATH}"

# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

# Ubuntu 16.04 (xenial) from 2017-07-23
# https://github.com/docker-library/official-images/commit/0ea9b38b835ffb656c497783321632ec7f87b60c
#FROM ubuntu@sha256:84c334414e2bfdcae99509a6add166bbb4fa4041dc3fa6af08046a66fed3005f
FROM analysis/rstudio

RUN apt-get -y install python3 python3-dev python3-pip
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir notebook jupyterhub jupyterlab virtualenv
RUN jupyter serverextension enable --py jupyterlab --sys-prefix

RUN apt-get -y install python python-dev python-pip
RUN virtualenv py27 --python=python2.7
RUN . /py27/bin/activate; pip install --no-cache-dir ipykernel
RUN . /py27/bin/activate; python -m ipykernel install --name py27 --display-name "Python 2.7"

ADD requirements.txt /tmp/python/
RUN pip3 install --no-cache-dir -r /tmp/python/requirements.txt
RUN . /py27/bin/activate; pip install --no-cache-dir -r /tmp/python/requirements.txt

RUN apt-get -y update
RUN apt-get -y install python3-tk python-tk

RUN python3 -m spacy download en
RUN . /py27/bin/activate; python -m spacy download en

COPY lab/jupyterlab-theme-light-extension/variables.css /usr/local/lib/python3.5/dist-packages/jupyterlab/themes/jupyterlab-theme-light-extension/
COPY lab/jupyterlab-theme-light-extension/roboto-mono.css /usr/local/lib/python3.5/dist-packages/jupyterlab/themes/jupyterlab-theme-light-extension/

COPY lab/jupyterlab-theme-dark-extension/variables.css /usr/local/lib/python3.5/dist-packages/jupyterlab/themes/jupyterlab-theme-dark-extension/
COPY lab/jupyterlab-theme-dark-extension/roboto-mono.css /usr/local/lib/python3.5/dist-packages/jupyterlab/themes/jupyterlab-theme-dark-extension/

RUN ln -s /usr/local/share/jupyter /usr/share/jupyter

# Add local files as late as possible to avoid cache busting
COPY start.sh /usr/local/bin/
COPY start-notebook.sh /usr/local/bin/
COPY start-singleuser.sh /usr/local/bin/
COPY jupyter_notebook_config.py /etc/jupyter/

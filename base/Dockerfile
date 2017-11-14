FROM ubuntu:16.04

USER root

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN echo "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" | tee -a /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository -y ppa:opencpu/jq
RUN add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable

# Install all OS dependencies for notebook server that starts but lacks all
# features (e.g., download as all possible file formats)
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -yq dist-upgrade \
 && apt-get install -yq --no-install-recommends \
    wget vim tmux curl git \
    bzip2 ca-certificates sudo locales \
    fonts-liberation gdebi-core r-base r-base-dev \
    build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev \
    libzmq3-dev libsasl2-dev libgsl0-dev libudunits2-dev \
    libprotobuf-dev libjq-dev libgdal-dev openjdk-8-jdk \
    libmagick++-dev libglu1-mesa-dev libffi-dev libgsl-dev \
    libv8-3.14-dev libproj-dev

RUN apt-get install -y texlive-full

RUN ln -s /usr/lib/jvm/java-8-openjdk-amd64 /usr/lib/jvm/default-java

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

# Install Tini
RUN wget --quiet https://github.com/krallin/tini/releases/download/v0.10.0/tini && \
    echo "1361527f39190a7338a0b434bd8c88ff7233ce7b9a4876f3315c22fce7eca1b0 *tini" | sha256sum -c - && \
    mv tini /usr/local/bin/tini && \
    chmod +x /usr/local/bin/tini

# Configure environment
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

FROM gocd/gocd-agent-debian-11:v23.1.0

ENV DEBIAN_FRONTEND=noninteractive

USER root

# Base packages
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  curl \
  wget \
  ca-certificates \
  make \
  binutils \
  git \
  gnupg2 \
  libc6-dev \
  libcurl4 \
  libedit2 \
  libgcc-9-dev \
  libpython2.7 \
  libsqlite3-0 \
  libstdc++-9-dev \
  libxml2 \
  libz3-dev \
  pkg-config \
  tzdata \
  zlib1g-dev \
  python3 \
  python3-pip

# swift
RUN wget https://download.swift.org/swift-5.8-release/ubuntu2004/swift-5.8-RELEASE/swift-5.8-RELEASE-ubuntu20.04.tar.gz \
    && tar -xvzf swift-5.8-RELEASE-ubuntu20.04.tar.gz \
    && mv swift-5.8-RELEASE-ubuntu20.04 /opt/swift \
    && rm -rf swift-5.8* \
    && wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import - \
    && echo "export PATH=/opt/swift/usr/bin:$PATH" >> ~/.bashrc




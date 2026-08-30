#!/usr/bin/env bash
set -euo pipefail

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
  ansible-core \
  ansible-lint \
  bash-completion \
  ca-certificates \
  curl \
  dnsutils \
  git \
  iproute2 \
  iputils-ping \
  jq \
  make \
  maven \
  netcat-openbsd \
  openssh-client \
  openssl \
  pipx \
  python3 \
  python3-pip \
  python3-venv \
  shellcheck \
  tcpdump \
  traceroute \
  unzip

pipx ensurepath

ansible --version
ansible-lint --version
mvn --version
python3 --version
shellcheck --version


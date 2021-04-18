#!/bin/bash

apt-get update \
  && apt-get install -y htop \
    iproute2 \
    less \
    nano \
    ssh \
    wget \
    unzip \
  && apt-get clean \
  && rm -rf /var/cache/apt/*

current_dir="${0%/*}"
container_init_directory="${1}"

echo "Copying php initial scripts to the global init directory"
cp -R "${current_dir}/init.d/." "${container_init_directory}"

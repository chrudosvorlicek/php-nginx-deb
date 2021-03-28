#!/bin/sh

apt-get update \
&& apt-get install -y nginx less\
&& apt-get clean \
&& rm -rf /var/cache/apt/*

current_dir="${0%/*}"
container_init_directory="${1}"

echo "Copying nginx initial scripts to the global init directory"
cp -R "${current_dir}/init.d/." "${container_init_directory}"

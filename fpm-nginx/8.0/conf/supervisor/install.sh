#!/bin/bash

apt-get update \
&& apt-get install -y python3-pip\
&& pip3 install supervisor \
&& apt-get remove -y python3-pip\
&& apt-get autoremove \
&& apt-get clean \
&& rm -rf /var/cache/apt/*

mkdir -p /etc/supervisor/conf.d
touch /etc/supervisor/conf.d/programs.conf

current_dir="${0%/*}"
container_init_directory="${1}"

echo "Copying supervisor initial scripts to the global init directory"
cp -R "${current_dir}/init.d/." "${container_init_directory}"



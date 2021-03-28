#!/bin/bash

current_dir="${0%/*}"
container_init_directory="${1}"

echo "Copying xdebug initial scripts to the global init directory"
cp -R "${current_dir}/init.d/." "${container_init_directory}"

echo "Installing xdebug extension"
    pecl install xdebug-3.0.2 \
    && docker-php-ext-enable xdebug

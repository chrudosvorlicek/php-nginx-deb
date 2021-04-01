#!/bin/bash

current_dir="${0%/*}"
container_init_directory="${1}"

echo "Copying php initial scripts to the global init directory"
cp -R "${current_dir}/init.d/." "${container_init_directory}"

mkdir -p /var/log/php-fpm
touch /var/log/php-fpm/worker.log
touch /var/log/php-fpm/worker-error.log
chown www-data /var/log/php-fpm/worker.log
chown www-data /var/log/php-fpm/worker-error.log

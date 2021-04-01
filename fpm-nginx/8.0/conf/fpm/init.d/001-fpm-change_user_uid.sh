#!/bin/bash

if [[ ! -z "${FPM_USER_ID}" ]] ; then
    echo "FPM_USER_ID specified: ${FPM_USER_ID}"

    if id www-data >/dev/null 2>&1; then
	    echo "Found user www-data, deleting..."
        deluser www-data
    fi

    echo "Creating new user www-data"

    adduser \
        -u "${FPM_USER_ID}" \
        --disabled-password \
        --no-create-home \
        --gecos "" \
    www-data

    # Create composer cache directory
    mkdir -p /home/www-data/.composer/cache/vcs

    # Change ownership of the home directory
    chown -R www-data:www-data /home/www-data
fi

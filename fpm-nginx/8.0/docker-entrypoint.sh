#!/bin/bash
# docker-entrypoint.sh v1.0.0

[ -z "${APP_DIR}" ] && APP_DIR="/var/www"
[ -z "${INIT_DIR}" ] && INIT_DIR="/opt/preset/init.d"
[ -z "${RUN_INIT_SCRIPTS}" ] && RUN_INIT_SCRIPTS="1"
[ -z "${CUSTOM_SCRIPTS_PATH}" ] && CUSTOM_SCRIPTS_PATH="/opt/preset/user-init.d"

mkdir -p "${APP_DIR}"
cd "${APP_DIR}"

if [ ! -z "${RUN_INIT_SCRIPTS}" ] && [ "${RUN_INIT_SCRIPTS}" == "1" ]; then
    if [ -d "${CUSTOM_SCRIPTS_PATH}" ]; then
        cp -r "${CUSTOM_SCRIPTS_PATH}/." "${INIT_DIR}"
    fi

    for filename in "${INIT_DIR}"/*.sh; do
        if [[ -f "${filename}" ]]; then
            echo "${filename}"
            bash "${filename}"

            if [[ "${?}" != 0 ]]; then
                echo "ERROR: init script ${filename} exitted with non-zero code"
                exit 1
            fi
        fi
    done
fi

exec "${@}"

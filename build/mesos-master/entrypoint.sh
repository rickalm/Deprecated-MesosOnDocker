#!/bin/sh

if [ -n "$SECRET" ]; then
    touch /tmp/credentials
    chmod 600 /tmp/credentials
    echo -n "${PRINCIPAL:-root} $SECRET" > /tmp/credentials

    export MESOS_AUTHENTICATE=true
    export MESOS_AUTHENTICATE_SLAVES=true
    export MESOS_CREDENTIALS=/tmp/credentials
fi

exec "$@"

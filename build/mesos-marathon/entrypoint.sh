#!/bin/sh

if [ -n "$SECRET" ]; then
    touch /tmp/secret
    chmod 600 /tmp/secret
    echo -n "$SECRET" > /tmp/secret

    export MARATHON_MESOS_AUTHENTICATION_PRINCIPAL=${PRINCIPAL:-root}
    export MARATHON_MESOS_AUTHENTICATION_SECRET_FILE=/tmp/secret
fi

exec "$@"

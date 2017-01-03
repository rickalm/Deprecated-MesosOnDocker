#!/bin/sh

cat <<EOF >/config.json
{
  "zk": "${MESOS_ZK:-zk://127.0.0.1:2181/mesos}",
  "masters": ["${MESOS_MASTERS:-127.0.0.1:5050}"],
  "stateTimeoutSeconds": 300,
  "refreshSeconds": 60,
  "ttl": 60,
  "domain": "mesos",
  "ns": "ns1",
  "port": ${MESOS_DNS_PORT:-8053},
  "resolvers": ["8.8.8.8"],
  "timeout": 5,
  "listener": "0.0.0.0",
  "SOAMname": "ns1.mesos",
  "SOARname": "root.ns1.mesos",
  "SOARefresh": 60,
  "SOARetry":   600,
  "SOAExpire":  86400,
  "SOAMinttl": 60,
  "dnson": true,
  "httpon": ${MESOS_DNS_HTTP_ENABLED:-true},
  "httpport": ${MESOS_DNS_HTTP_PORT:-8123},
  "externalon": true,
  "recurseon": true,
  "IPSources": ["mesos", "host"],
  "EnforceRFC952": false,
  "EnumerationOn": true
}
EOF

exec "$@"

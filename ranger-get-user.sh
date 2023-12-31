#!/usr/bin/env bash
. ranger-config.sh

# Get all users
if [ "$1" == "" ]; then
  curl -k -u ${RANGER_USER}:${RANGER_PASSWD} -X GET ${RANGER_URL}/service/xusers/users
else
  curl -k -u ${RANGER_USER}:${RANGER_PASSWD} -X GET ${RANGER_URL}/service/xusers/secure/users/$1
fi

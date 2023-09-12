#!/usr/bin/env bash
userId=$1
if [ "$userId" == "" ]; then
	echo "$0 userId"
	exit 104
fi

. ranger-config.sh

# Get all users
if [ $1 != "" ]; then
  curl -i -v -u ${RANGER_USER}:${RANGER_PASSWD} -X DELETE ${RANGER_URL}/service/xusers/secure/users/id/${userId}?forceDelete=true
fi

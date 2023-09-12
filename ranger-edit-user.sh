#!/usr/bin/env bash
userId=$1
file_json=$2
if [ "$file_json" == "" ]; then
	echo "To edit user:"
	echo "1. Get user info with: ./ranger-get-user.sh [userId] > /tmp/[userId].json"
	echo "2. Edit your custom parameters and also 'Password' field in json file."
	echo "3. Run this script with 2 parameters:"
	echo "$0 userId /path/file.json"
	exit 103
fi

. ranger-config.sh

# Edit user
curl -v -i -s -u ${RANGER_USER}:${RANGER_PASSWD} \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-d @${file_json} \
	-X PUT ${RANGER_URL}/service/xusers/secure/users/${userId}

#!/usr/bin/env bash
username=$1
if [ "${username}" == "" ]; then
	echo "$0 username"
	exit 2
fi

. ranger-config.sh

# Create new user
curl -s -u ${RANGER_USER}:${RANGER_PASSWD} \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-d "{
              \"name\": \"${username}\",
              \"firstName\": \"${username}\",
              \"password\": \"${USER_PASSWD}\",
              \"description\": \"curl RESTAPI\",
              \"status\": 1,
              \"userRoleList\": [\"ROLE_USER\"]
            }" \
	-X POST ${RANGER_URL}/service/xusers/secure/users

# To add to group add this property:
# ex: nifi group id is 57
	      #\"groupIdList\": [57],

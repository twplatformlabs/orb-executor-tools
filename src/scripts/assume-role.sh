#!/bin/sh
# shellcheck disable=SC2155,SC2086
# scripts/assume-role.sh
#
# expects the folling environment variables
# AWS_ROLE
# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY
# AWS_DEFAULT_REGION

Assume () {
  echo 'assume'
  echo "${AWS_ROLE}"
  TMP="$(aws sts assume-role --output json --role-arn ${AWS_ROLE} --role-session-name 'orb-exeecutor-tools-pipeline' || { echo 'sts failure!' ; exit 1; })"

  export AWS_ACCESS_KEY_ID=$(echo $TMP | jq -r ".Credentials.AccessKeyId")
  export AWS_SECRET_ACCESS_KEY=$(echo $TMP | jq -r ".Credentials.SecretAccessKey")
  export AWS_SESSION_TOKEN=$(echo $TMP | jq -r ".Credentials.SessionToken")
}

# scripts/assume-role.sh
# shellcheck disable=SC2155,SC2086
#
# AWS_ROLE
# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY
# AWS_DEFAULT_REGION

Assume () {
  TMP="$(aws sts assume-role --output json --role-arn "${AWS_ROLE}" --role-session-name "orb-exeecutor-tools-pipeline" || { echo 'sts failure!' ; exit 1; })"

  export ACCESS_KEY=$(echo $TMP | jq -r ".Credentials.AccessKeyId")
  export SECRET_KEY=$(echo $TMP | jq -r ".Credentials.SecretAccessKey")
  export SESSION_TOKEN=$(echo $TMP | jq -r ".Credentials.SessionToken")

  # write role session credentials to ephemeral executor
  mkdir ~/.aws
  cat <<EOF > ~/.aws/credentials
[default]
aws_access_key_id=${ACCESS_KEY}
aws_secret_access_key=${SECRET_KEY}
aws_session_token=${SESSION_TOKEN}
region=${AWS_DEFAULT_REGION}
EOF
}

if [[ "$_" == "$0" ]]; then
    Assume
fi

#!/usr/bin/env bash
DEFAULT_REGION="$1"
AWS_ACCESS_KEY_ID="$2"
AWS_SECRET_ACCESS_KEY="$3"

if [ -z "$DEFAULT_REGION" ] || [ -z "$AWS_ACCESS_KEY_ID" ] || [ -z "$AWS_SECRET_ACCESS_KEY" ]
then
	echo "Usage: awscli_install.sh <defaultRegion> <aws_access_key_id> <aws_secret_access_key>"
	exit 1;
fi

mkdir -p "$HOME/.aws/config"

echo "[default]" > "$HOME/.aws/config"
echo "region = $DEFAULT_REGION" >> "$HOME/.aws/config"
chmod 600 "$HOME/.aws/config"

echo "[default]" > "$HOME/.aws/credentials"
echo "aws_access_key_id = $AWS_ACCESS_KEY_ID" >> "$HOME/.aws/credentials"
echo "aws_secret_access_key = $AWS_SECRET_ACCESS_KEY" >> "$HOME/.aws/credentials"
chmod 600 "$HOME/.aws/credentials"

aws --version
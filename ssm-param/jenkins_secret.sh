#!/bin/bash

set -e

# Generate random 8-character alphanumeric password
JENKINS_SECRET=$(LC_ALL=C tr -dc 'A-Za-z0-9' </dev/urandom | head -c 8)

# Parameter name
PARAM_NAME="/jenkins/secret"

AWS_REGION="us-east-1"

echo "[+] Creating SSM parameter: $PARAM_NAME"
aws ssm put-parameter \
  --name "$PARAM_NAME" \
  --value "$JENKINS_SECRET" \
  --type "SecureString" \
  --overwrite \
  --region "$AWS_REGION"

echo "[✔] Secret stored successfully in SSM."
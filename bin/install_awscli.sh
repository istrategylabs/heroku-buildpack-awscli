#!/bin/bash

set -e

indent() {
  sed -u 's/^/       /'
}

arrow() {
  sed -u 's/^/-----> /'
}

echo "Configuring awscli in ~/.aws" | arrow
mkdir ~/.aws

cat >> ~/.aws/credentials << EOF
[default]
aws_access_key_id = $AWS_ACCESS_KEY_ID
aws_secret_access_key = $AWS_SECRET_ACCESS_KEY
EOF

cat >> ~/.aws/config << EOF
[default]
region = $AWS_REGION
EOF

echo "It will be automatically run on dyno launch." | indent
echo "Make sure to set AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY and AWS_REGION variables in ENV." | indent
echo

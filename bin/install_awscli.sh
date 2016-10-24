#!/bin/bash

set -e

indent() {
  sed -u 's/^/       /'
}

arrow() {
  sed -u 's/^/-----> /'
}

APP_DIR="/app"
INSTALL_DIR="$APP_DIR/vendor/awscli"
BUNDLE_DIR="$APP_DIR/vendor/awscli-bundle"

echo "Installing awscli..." | arrow
chmod +x "$BUNDLE_DIR/install"
"$BUNDLE_DIR/install" --install-dir "$INSTALL_DIR" --bin-location "$APP_DIR/bin/aws" | indent
chmod u+x "$INSTALL_DIR/bin/aws"

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

#!/bin/bash
set -e

echo "📁 Changing to working directory: $WORKING_DIR"
cd "$WORKING_DIR"

echo "📦 Initializing Terraform..."
terraform init -input=false

echo "🔍 Running Terraform plan..."
terraform plan -input=false

echo "🚀 Applying Terraform..."
terraform apply -auto-approve -input=false

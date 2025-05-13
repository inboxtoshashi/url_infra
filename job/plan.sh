#!/bin/bash

# Move to the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Move to project root (one level above scripts/)
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "[📍] Moving to Terraform project root: $PROJECT_ROOT"
cd "$PROJECT_ROOT" || { echo "[❌] Could not change directory to $PROJECT_ROOT"; exit 1; }

# List files to confirm you're in the right directory
echo "[📁] Files in current directory:"
ls -l

# Initialize and plan Terraform
echo "[🔄] Running terraform init..."
terraform init -input=false || { echo "[❌] terraform init failed"; exit 1; }

echo "[🔍] Running terraform plan..."
terraform plan -input=false || { echo "[❌] terraform plan failed"; exit 1; }

echo "[✅] Plan complete."
#!/bin/bash

# Set the directory where your main.tf and other Terraform configs are located
TF_DIR="../url_infra"  # Adjust this path to your actual structure

echo "[📍] Changing directory to Terraform config: $TF_DIR"
cd "$TF_DIR" || { echo "[❌] Failed to enter Terraform directory"; exit 1; }

echo "[🔄] Initializing Terraform..."
terraform init -input=false

echo "[🔍] Running Terraform plan..."
terraform destroy -input=false

echo "[✅] Terraform destroy completed."

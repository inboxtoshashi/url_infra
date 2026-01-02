#!/bin/bash
# Terraform State Backup Script
# Backs up terraform state to centralized location with versioning
# Usage: ./backup_tfstate.sh <env> <source_state_path>

set -e

ENV="${1}"
SOURCE_STATE="${2}"
TIMESTAMP=$(date +'%Y%m%d_%H%M%S')

if [ -z "$ENV" ] || [ -z "$SOURCE_STATE" ]; then
  echo "Usage: $0 <env> <source_state_path>"
  echo "Example: $0 dev /path/to/terraform.tfstate"
  exit 1
fi

# Detect platform and set centralized state directory
OS="$(uname -s)"
if [[ "$OS" == "Darwin" ]]; then
  CENTRAL_STATE_DIR="$HOME/.jenkins/workspace/terraform-states"
elif [[ "$OS" == "Linux" ]]; then
  CENTRAL_STATE_DIR="/var/lib/jenkins/workspace/terraform-states"
else
  CENTRAL_STATE_DIR="$HOME/.jenkins/workspace/terraform-states"
fi

ENV_DIR="$CENTRAL_STATE_DIR/$ENV"
BACKUP_DIR="$CENTRAL_STATE_DIR/backups"

# Create directories
mkdir -p "$ENV_DIR" "$BACKUP_DIR"

echo "[$(date +'%Y-%m-%d %H:%M:%S')] 💾 Backing up Terraform state for $ENV..."

# Check source exists
if [ ! -f "$SOURCE_STATE" ]; then
  echo "[$(date +'%Y-%m-%d %H:%M:%S')] ⚠️  Source state not found: $SOURCE_STATE"
  exit 0
fi

# Backup existing centralized state
if [ -f "$ENV_DIR/terraform.tfstate" ]; then
  BACKUP_FILE="$BACKUP_DIR/terraform.tfstate.${ENV}.${TIMESTAMP}"
  cp "$ENV_DIR/terraform.tfstate" "$BACKUP_FILE"
  echo "[$(date +'%Y-%m-%d %H:%M:%S')] 📦 Backed up: $(basename $BACKUP_FILE)"
fi

# Copy new state to centralized location
cp "$SOURCE_STATE" "$ENV_DIR/terraform.tfstate"
echo "[$(date +'%Y-%m-%d %H:%M:%S')] ✅ Updated: $ENV_DIR/terraform.tfstate"

# Keep only last 10 backups per environment
cd "$BACKUP_DIR"
BACKUP_COUNT=$(ls -1 terraform.tfstate.${ENV}.* 2>/dev/null | wc -l | tr -d ' ')
if [ "$BACKUP_COUNT" -gt 10 ]; then
  ls -t terraform.tfstate.${ENV}.* | tail -n +11 | xargs rm -f
  echo "[$(date +'%Y-%m-%d %H:%M:%S')] 🧹 Cleaned old backups (kept last 10)"
fi

echo "[$(date +'%Y-%m-%d %H:%M:%S')] 🎉 Backup complete! Total backups for $ENV: $BACKUP_COUNT"

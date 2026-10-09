#!/usr/bin/env bash
set -Eeuo pipefail

PROJECT_DIR="$HOME/restic-disaster-recovery"
source "$PROJECT_DIR/config/backup.conf"

echo "=== Backup Health Check ==="
echo "Date: $(date)"

echo
echo "1. Checking repository integrity..."
restic --repo "$REPOSITORY" \
    --password-file "$PASSWORD_FILE" check

echo
echo "2. Listing snapshots..."
restic --repo "$REPOSITORY" \
    --password-file "$PASSWORD_FILE" snapshots

echo
echo "3. Checking source directory..."
test -d "$SOURCE_DIR"
find "$SOURCE_DIR" -type f

echo
echo "Health check completed successfully."

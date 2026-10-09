#!/usr/bin/env bash
set -Eeuo pipefail

PROJECT_DIR="$HOME/restic-disaster-recovery"
source "$PROJECT_DIR/config/backup.conf"

mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/backup.log"

exec >> "$LOG_FILE" 2>&1

echo "========================================"
echo "Backup started: $(date)"
echo "Source: $SOURCE_DIR"

if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "ERROR: Source directory does not exist."
    exit 1
fi

if [[ ! -f "$PASSWORD_FILE" ]]; then
    echo "ERROR: Password file does not exist."
    exit 1
fi

restic --repo "$REPOSITORY" \
    --password-file "$PASSWORD_FILE" \
    backup "$SOURCE_DIR" \
    --tag automated

echo "Backup completed: $(date)"
echo "========================================"

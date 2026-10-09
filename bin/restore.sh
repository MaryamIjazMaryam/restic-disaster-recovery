#!/usr/bin/env bash
set -Eeuo pipefail

PROJECT_DIR="$HOME/restic-disaster-recovery"
source "$PROJECT_DIR/config/backup.conf"

if ! restic --repo "$REPOSITORY" \
    --password-file "$PASSWORD_FILE" snapshots --quiet | grep -q .; then
    echo "ERROR: No snapshots available to restore."
    exit 1
fi

TARGET="$RESTORE_DIR/restore-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$TARGET"

echo "Restoring latest snapshot to: $TARGET"

restic --repo "$REPOSITORY" \
    --password-file "$PASSWORD_FILE" \
    restore latest --target "$TARGET"

echo "Restore completed."
echo "Restored files are under: $TARGET"

# Restic Backup and Disaster Recovery System

## Overview

An intermediate-level Linux project for encrypted backups,
snapshot management, file restoration, and disaster-recovery testing.

## Technologies

- Ubuntu Linux on WSL
- Bash scripting
- Restic
- Cron
- Git

## Features

- Encrypted local backup repository
- Automated backup script
- Snapshot listing and restoration
- Repository integrity checks
- Backup retention policy
- Daily scheduling with cron
- Disaster-recovery test
- Log output for backup operations

## Project Structure

- `bin/backup.sh`: Create a backup snapshot
- `bin/restore.sh`: Restore the latest snapshot
- `bin/health-check.sh`: Check repository integrity
- `config/backup.conf`: Project paths and settings
- `data/`: Sample files to back up
- `logs/`: Runtime backup logs
- `restore-tests/`: Local recovery tests (not committed)

## Setup

Install the required tools:

    sudo apt update
    sudo apt install -y restic git cron openssl

Generate a private repository password, configure the paths,
and initialize the repository as described in the project guide.

Run a backup:

    ./bin/backup.sh

List snapshots:

    source config/backup.conf
    restic --repo "$REPOSITORY" --password-file "$PASSWORD_FILE" snapshots

Restore the latest snapshot:

    ./bin/restore.sh

Run the health check:

    ./bin/health-check.sh

## Security Notes

Keep the repository password private. Do not commit the password,
local repository, logs, or recovered test data to Git.

A local WSL repository is for learning and testing. Production
disaster recovery should also use separate storage or a protected
remote destination.

## Learning Outcomes

- Linux directory and permission management
- Bash automation
- Encrypted backups and snapshot concepts
- Data restoration and integrity verification
- Cron scheduling
- Git project organization

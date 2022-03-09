#!/bin/bash
# $ ./restore-firestore.sh .env

set -o allexport
source "$1"
set +o allexport

export GOOGLE_APPLICATION_CREDENTIALS="../terraform/sa-$ENV_FLAVOR.json"

# npm install -g node-firestore-import-export;
firestore-import --backupFile db.json --yes

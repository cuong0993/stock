#!/bin/bash
# $ ./backup-firestore.sh .env

set -o allexport
source "$1"
set +o allexport

export GOOGLE_APPLICATION_CREDENTIALS="../terraform/sa-$ENV_FLAVOR.json"

# npm install -g node-firestore-import-export;
firestore-export --backupFile db.json --prettyPrint
jq --sort-keys . db.json >db1.json
rm db.json
mv db1.json db.json

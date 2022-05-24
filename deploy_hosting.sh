#!/bin/bash
# $ ./deploy_hosting.sh .env

set -o allexport
source "$1"
set +o allexport

export GOOGLE_APPLICATION_CREDENTIALS="terraform/sa-$ENV_FLAVOR.json"

flutter build web --web-renderer html
firebase deploy --only hosting --project "$ENV_FIREBASE_APP_ID"

#!/bin/bash
# $ ./deploy_hosting.sh .env

set -o allexport
source "$1"
set +o allexport

export GOOGLE_APPLICATION_CREDENTIALS="terraform/sa-$ENV_FLAVOR.json"

flutter build web --web-renderer html --dart-define=ENV_FIREBASE_APP_REGION="$ENV_FIREBASE_APP_REGION" --dart-define=ENV_FACEBOOK_APP_ID="$ENV_FACEBOOK_APP_ID" --dart-define=ENV_FACEBOOK_APP_SECRET="$ENV_FACEBOOK_APP_SECRET" --dart-define=ENV_FLAVOR="$ENV_FLAVOR"
firebase deploy --only hosting --project "$ENV_FIREBASE_APP_ID"

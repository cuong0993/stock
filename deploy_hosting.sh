#!/bin/bash
# $ ./deploy_hosting.sh .env

set -o allexport
source "$1"
set +o allexport

export GOOGLE_APPLICATION_CREDENTIALS="terraform/sa-$ENV_FLAVOR.json"

flutter build web --web-renderer html --dart-define=ENV_GCP_PROJECT_REGION="$ENV_GCP_PROJECT_REGION" --dart-define=ENV_FACEBOOK_APP_ID="$ENV_FACEBOOK_APP_ID" --dart-define=ENV_FACEBOOK_APP_SECRET="$ENV_FACEBOOK_APP_SECRET" --dart-define=ENV_VAPID_KEY="$ENV_VAPID_KEY" --dart-define=ENV_FLAVOR="$ENV_FLAVOR"
firebase deploy --only hosting --project "$ENV_GCP_PROJECT_ID"

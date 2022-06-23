#!/bin/bash
# $ ./deploy_functions_and_rules.sh .env

set -o allexport
source "$1"
set +o allexport

export GOOGLE_APPLICATION_CREDENTIALS="../terraform/sa-$ENV_FLAVOR.json"

(
  gcloud config set functions/region "$ENV_GCP_PROJECT_REGION"
  firebase deploy --only firestore --project "$ENV_GCP_PROJECT_ID"
  firebase deploy --only storage --project "$ENV_GCP_PROJECT_ID"
)
(
  cd java || exit
  gcloud functions deploy OnUserSignUp --entry-point functions.OnUserSignUp --runtime java17 --trigger-event providers/firebase.auth/eventTypes/user.create --project="$ENV_GCP_PROJECT_ID" --update-env-vars "GOOGLE_CLOUD_PROJECT=$ENV_GCP_PROJECT_ID" --memory=256MB --timeout=540s
  gcloud functions deploy OnUserDeleted --entry-point functions.OnUserDeleted --runtime java17 --trigger-event providers/firebase.auth/eventTypes/user.delete --project="$ENV_GCP_PROJECT_ID" --update-env-vars "GOOGLE_CLOUD_PROJECT=$ENV_GCP_PROJECT_ID" --memory=256MB --timeout=540s
)

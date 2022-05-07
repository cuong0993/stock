#!/bin/bash
# $ ./deploy.sh .env

set -o allexport
source "$1"
set +o allexport

./gradlew jib -Pgcp_project="$ENV_FIREBASE_APP_ID"
gcloud run deploy analyze-market-service --image=gcr.io/"$ENV_FIREBASE_APP_ID"/app:latest --project="$ENV_FIREBASE_APP_ID" --region="$ENV_FIREBASE_APP_REGION"

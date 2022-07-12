#!/bin/bash
# $ ./deploy.sh .env

set -o allexport
source "$1"
set +o allexport

export GOOGLE_APPLICATION_CREDENTIALS="../terraform/sa-$ENV_FLAVOR.json"
TOKEN=$(gcloud auth application-default print-access-token)
echo "$TOKEN"

./gradlew jib -PgcpProject="$ENV_GCP_PROJECT_ID"
gcloud run deploy analyze-market-service --image=gcr.io/"$ENV_GCP_PROJECT_ID"/app:latest --project="$ENV_GCP_PROJECT_ID" --region="$ENV_GCP_PROJECT_REGION"

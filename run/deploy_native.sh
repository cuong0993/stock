#!/bin/bash
# $ ./deploy_native.sh .env

set -o allexport
source "$1"
set +o allexport

export GOOGLE_APPLICATION_CREDENTIALS="../terraform/sa-$ENV_FLAVOR.json"
TOKEN=$(gcloud auth application-default print-access-token)
echo "$TOKEN"

gcloud builds submit --tag gcr.io/"$ENV_FIREBASE_APP_ID"/native --project="$ENV_FIREBASE_APP_ID" --machine-type=E2_HIGHCPU_32
gcloud run deploy analyze-market-service --image=gcr.io/"$ENV_FIREBASE_APP_ID"/native:latest --project="$ENV_FIREBASE_APP_ID" --region="$ENV_FIREBASE_APP_REGION"

#!/bin/bash
# $ ./create_gcp_project.sh .env

set -o allexport
source "$1"
set +o allexport

if gcloud projects create "$ENV_FIREBASE_APP_ID" --name="Guide Stream $ENV_FLAVOR"; then
  gcloud alpha billing accounts projects link "$ENV_FIREBASE_APP_ID" --billing-account="$ENV_FIREBASE_BILLING_ACCOUNT"
  ACCOUNT="sa-$ENV_FLAVOR"
  EMAIL="${ACCOUNT}@$ENV_FIREBASE_APP_ID.iam.gserviceaccount.com"
  gcloud iam service-accounts create "$ACCOUNT" --project="$ENV_FIREBASE_APP_ID"
  gcloud projects add-iam-policy-binding "$ENV_FIREBASE_APP_ID" --member=serviceAccount:"$EMAIL" --role=roles/owner
  gcloud iam service-accounts keys create "$PWD/$ACCOUNT.json" --iam-account="$EMAIL" --project="$ENV_FIREBASE_APP_ID"

  gsutil mb -p "$ENV_FIREBASE_APP_ID" -l "$ENV_FIREBASE_APP_REGION" gs://tf-state-"$ENV_FIREBASE_APP_ID"
  gsutil versioning set on gs://tf-state-"$ENV_FIREBASE_APP_ID"
  gsutil lifecycle set state-bucket-lifecycle.json gs://tf-state-"$ENV_FIREBASE_APP_ID"
fi

#!/bin/bash
# $ ./create_gcp_project.sh .env

set -o allexport
source "$1"
set +o allexport

if gcloud projects create "$ENV_GCP_PROJECT_ID" --name="Stock $ENV_FLAVOR"; then
  gcloud alpha billing accounts projects link "$ENV_GCP_PROJECT_ID" --billing-account="$ENV_GCP_BILLING_ACCOUNT"
  ACCOUNT="sa-$ENV_FLAVOR"
  EMAIL="${ACCOUNT}@$ENV_GCP_PROJECT_ID.iam.gserviceaccount.com"
  gcloud iam service-accounts create "$ACCOUNT" --project="$ENV_GCP_PROJECT_ID"
  gcloud projects add-iam-policy-binding "$ENV_GCP_PROJECT_ID" --member=serviceAccount:"$EMAIL" --role=roles/owner
  gcloud iam service-accounts keys create "$PWD/$ACCOUNT.json" --iam-account="$EMAIL" --project="$ENV_GCP_PROJECT_ID"

  gsutil mb -p "$ENV_GCP_PROJECT_ID" -l "$ENV_GCP_PROJECT_REGION" gs://tf-state-"$ENV_GCP_PROJECT_ID"
  gsutil versioning set on gs://tf-state-"$ENV_GCP_PROJECT_ID"
  gsutil lifecycle set state-bucket-lifecycle.json gs://tf-state-"$ENV_GCP_PROJECT_ID"
fi

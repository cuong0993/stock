#!/bin/bash

set -o allexport
source ".env.dev"
set +o allexport

gh secret set GOOGLE_SERVICES_STAGE_JSON <android/app/src/stage/google-services.json
gh secret set KEYSTORE_PROPERTIES <android/key.properties
gh secret set SERVICE_ACCOUNT_STAGE_JSON <terraform/sa-stage.json
gh secret set RELEASE_JKS --body "$(base64 android/release.jks)"
gh secret set ENV_GCP_PROJECT_REGION --body "$ENV_GCP_PROJECT_REGION"
gh secret set ENV_FACEBOOK_APP_ID --body "$ENV_FACEBOOK_APP_ID"
gh secret set ENV_FACEBOOK_APP_SECRET --body "$ENV_FACEBOOK_APP_SECRET"
gh secret set FIREBASE_WEB_CONFIG_DART <data/lib/src/firebase_web_config.dart
gh secret set ENV_VAPID_KEY --body "$(jq '.publicKey' private_keys/vapid_key.json | sed 's/"//g')"

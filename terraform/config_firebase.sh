#!/bin/bash
# $ ./config_firebase.sh .env

set -o allexport
source "$1"
set +o allexport

export GOOGLE_APPLICATION_CREDENTIALS="../terraform/sa-$ENV_FLAVOR.json"
TOKEN=$(gcloud auth application-default print-access-token)
echo "$TOKEN"

curl -X POST "https://identitytoolkit.googleapis.com/v2/projects/$ENV_GCP_PROJECT_ID/defaultSupportedIdpConfigs?idpId=facebook.com" \
  -H "Authorization: Bearer $TOKEN" \
  -H 'Content-Type: application/json' \
  -d "{ name : \"projects/$ENV_GCP_PROJECT_ID/defaultSupportedIdpConfigs/facebook.com\", enabled : true, clientId : \"$ENV_FACEBOOK_APP_ID\", clientSecret : \"$ENV_FACEBOOK_APP_SECRET\" }"

curl -X POST "https://firebase.googleapis.com/v1beta1/projects/$ENV_GCP_PROJECT_ID/androidApps" \
  -H "Authorization: Bearer $TOKEN" \
  -H 'Content-Type: application/json' \
  -d '{"packageName": "com.chaomao.stock" }'

curl -X POST "https://firebase.googleapis.com/v1beta1/projects/$ENV_GCP_PROJECT_ID/iosApps" \
  -H "Authorization: Bearer $TOKEN" \
  -H 'Content-Type: application/json' \
  -d '{"bundleId": "com.chaomao.stock" }'

ANDROID_APP_ID=$(curl -X GET "https://firebase.googleapis.com/v1beta1/projects/$ENV_GCP_PROJECT_ID/androidApps" \
  -H "Authorization: Bearer $TOKEN" | (jq '.apps[].appId' | sed 's/"//g'))

set -o allexport
source ../android/key.properties
set +o allexport

DEBUG_KEY=$(keytool -list -v -keystore "../android/debug.jks" -alias "$debugKeyAlias" -storepass "$debugStorePassword" -keypass "$debugKeyPassword" | (grep "SHA1: " | cut -d' ' -f3 | sed 's/://g'))
echo "$DEBUG_KEY"
curl -X POST "https://firebase.googleapis.com/v1beta1/projects/$ENV_GCP_PROJECT_ID/androidApps/$ANDROID_APP_ID/sha" \
  -H "Authorization: Bearer $TOKEN" \
  -H 'Content-Type: application/json' \
  -d "{ certType : \"SHA_1\", shaHash : \"$DEBUG_KEY\" }"

RELEASE_KEY=$(keytool -list -v -keystore "../android/release.jks" -alias "$releaseKeyAlias" -storepass "$releaseStorePassword" -keypass "$releaseKeyPassword" | (grep "SHA1: " | cut -d' ' -f3 | sed 's/://g'))
echo "$RELEASE_KEY"
curl -X POST "https://firebase.googleapis.com/v1beta1/projects/$ENV_GCP_PROJECT_ID/androidApps/$ANDROID_APP_ID/sha" \
  -H "Authorization: Bearer $TOKEN" \
  -H 'Content-Type: application/json' \
  -d "{ certType : \"SHA_1\", shaHash : \"$RELEASE_KEY\" }"

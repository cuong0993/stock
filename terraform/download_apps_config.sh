#!/bin/bash
# $ ./download_apps_config.sh .env

set -o allexport
source "$1"
set +o allexport

export GOOGLE_APPLICATION_CREDENTIALS="sa-$ENV_FLAVOR.json"
TOKEN=$(gcloud auth application-default print-access-token)
echo "$TOKEN"

mkdir "../android/app/src/$ENV_FLAVOR"
ANDROID_APP_ID=$(curl -X GET "https://firebase.googleapis.com/v1beta1/projects/$ENV_GCP_PROJECT_ID/androidApps" \
  -H "Authorization: Bearer $TOKEN" | (jq '.apps[].appId' | sed 's/"//g'))
curl -X GET "https://firebase.googleapis.com/v1beta1/projects/$ENV_GCP_PROJECT_ID/androidApps/$ANDROID_APP_ID/config" \
  -H "Authorization: Bearer $TOKEN" | (jq '.configFileContents' | sed 's/"//g') | base64 -d | jq '.' >"../android/app/src/$ENV_FLAVOR/google-services.json"

mkdir -p "../ios/Runner/$ENV_FLAVOR"
IOS_APP_ID=$(curl -X GET "https://firebase.googleapis.com/v1beta1/projects/$ENV_GCP_PROJECT_ID/iosApps" \
  -H "Authorization: Bearer $TOKEN" | (jq '.apps[].appId' | sed 's/"//g'))
curl -X GET "https://firebase.googleapis.com/v1beta1/projects/$ENV_GCP_PROJECT_ID/iosApps/$IOS_APP_ID/config" \
  -H "Authorization: Bearer $TOKEN" | (jq '.configFileContents' | sed 's/"//g') | base64 -d >"../ios/Runner/$ENV_FLAVOR/GoogleService-Info.plist"
tidy -xml -iq -wrap -m "../ios/Runner/$ENV_FLAVOR/GoogleService-Info.plist"

mkdir -p "../macos/Runner/$ENV_FLAVOR"
cp "../ios/Runner/$ENV_FLAVOR/GoogleService-Info.plist" "../macos/Runner/$ENV_FLAVOR/GoogleService-Info.plist"

mkdir -p "../web/$ENV_FLAVOR"
WEB_APP_ID=$(curl -X GET "https://firebase.googleapis.com/v1beta1/projects/$ENV_GCP_PROJECT_ID/webApps" \
  -H "Authorization: Bearer $TOKEN" | (jq '.apps[].appId' | sed 's/"//g'))
CONFIG=$(curl -X GET "https://firebase.googleapis.com/v1beta1/projects/$ENV_GCP_PROJECT_ID/webApps/$WEB_APP_ID/config" \
  -H "Authorization: Bearer $TOKEN")
echo "Map<String, String> firebaseWebConfig = ${CONFIG};" >"../data/lib/src/firebase_web_config.dart"

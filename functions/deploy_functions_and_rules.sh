#!/bin/bash
# $ ./deploy_functions_and_rules.sh .env

set -o allexport
source "$1"
set +o allexport

export GOOGLE_APPLICATION_CREDENTIALS="../terraform/sa-$ENV_FLAVOR.json"

(
  gcloud config set functions/region "$ENV_FIREBASE_APP_REGION"
  firebase deploy --only firestore --project "$ENV_FIREBASE_APP_ID"
  firebase deploy --only storage --project "$ENV_FIREBASE_APP_ID"
)
(
  cd nodejs || exit
  yarn
  gcloud functions deploy GetAgoraToken --runtime nodejs16 --trigger-http --allow-unauthenticated --project="$ENV_FIREBASE_APP_ID" --update-env-vars "GOOGLE_CLOUD_PROJECT=$ENV_FIREBASE_APP_ID,ENV_AGORA_APP_ID=$ENV_AGORA_APP_ID,AGORA_PRIMARY_CERTIFICATE=$ENV_AGORA_PRIMARY_CERTIFICATE" --memory=256MB --timeout=540s
)
(
  cd java || exit
  gcloud functions deploy OnUserSignUp --entry-point functions.OnUserSignUp --runtime java11 --trigger-event providers/firebase.auth/eventTypes/user.create --project="$ENV_FIREBASE_APP_ID" --update-env-vars "GOOGLE_CLOUD_PROJECT=$ENV_FIREBASE_APP_ID" --memory=256MB --timeout=540s
  gcloud functions deploy OnUserDeleted --entry-point functions.OnUserDeleted --runtime java11 --trigger-event providers/firebase.auth/eventTypes/user.delete --project="$ENV_FIREBASE_APP_ID" --update-env-vars "GOOGLE_CLOUD_PROJECT=$ENV_FIREBASE_APP_ID" --memory=256MB --timeout=540s
  gcloud functions deploy OnMessageCreated --entry-point functions.OnMessageCreated --runtime java11 --trigger-event "providers/cloud.firestore/eventTypes/document.create" --trigger-resource "projects/$ENV_FIREBASE_APP_ID/databases/(default)/documents/conversations/{conversationId}/messages/{messageId}" --project="$ENV_FIREBASE_APP_ID" --update-env-vars "GOOGLE_CLOUD_PROJECT=$ENV_FIREBASE_APP_ID" --memory=256MB --timeout=540s
  gcloud functions deploy OnMeetingCreated --entry-point functions.OnMeetingCreated --runtime java11 --trigger-event "providers/cloud.firestore/eventTypes/document.create" --trigger-resource "projects/$ENV_FIREBASE_APP_ID/databases/(default)/documents/meetings/{meetingId}" --project="$ENV_FIREBASE_APP_ID" --update-env-vars "GOOGLE_CLOUD_PROJECT=$ENV_FIREBASE_APP_ID" --memory=256MB --timeout=540s
  gcloud functions deploy OnCommentCreated --entry-point functions.OnCommentCreated --runtime java11 --trigger-event "providers/cloud.firestore/eventTypes/document.create" --trigger-resource "projects/$ENV_FIREBASE_APP_ID/databases/(default)/documents/posts/{postId}/comments/{commentId}" --project="$ENV_FIREBASE_APP_ID" --update-env-vars "GOOGLE_CLOUD_PROJECT=$ENV_FIREBASE_APP_ID" --memory=256MB --timeout=540s
)

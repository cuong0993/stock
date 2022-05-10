#!/bin/bash

function entry_decode() { echo "${*}" | base64 --decode; }
IFS=',' read -r -a define_items <<<"$DART_DEFINES"
for index in "${!define_items[@]}"; do
  define_items[$index]=$(entry_decode "${define_items[$index]}")
done
printf "%s\n" "${define_items[@]}" | grep '^ENV_' >"${SRCROOT}"/Flutter/Environment.xcconfig

printf "%s\n" "Copy GoogleService-Info"
ENV_FLAVOR_KEY_VALUE="$(printf "%s\n" "${define_items[@]}" | grep "^ENV_FLAVOR=.*")"
ENV_FLAVOR="$(printf "%s\n" "$ENV_FLAVOR_KEY_VALUE" | awk -F"=" '{print $2}')"
touch "${SRCROOT}"/Runner/GoogleService-Info.plist
chmod o=r "${SRCROOT}"/Runner/GoogleService-Info.plist

printf "%s\n" "File is ${SRCROOT}/Runner/${ENV_FLAVOR}/GoogleService-Info.plist"
cat "${SRCROOT}/Runner/${ENV_FLAVOR}/GoogleService-Info.plist" >"${SRCROOT}"/Runner/GoogleService-Info.plist

echo "GOOGLE_SERVICE_REVERSED_CLIENT_ID=$(/usr/libexec/PlistBuddy -c 'print ":REVERSED_CLIENT_ID"' "${SRCROOT}"/Runner/GoogleService-Info.plist)" >>"${SRCROOT}"/Flutter/Environment.xcconfig

if [[ "$ENV_FLAVOR" == "prod" ]]; then
  echo "APP_NAME=Stock" >>"${SRCROOT}"/Flutter/Environment.xcconfig
else
  echo "APP_NAME=Stock $ENV_FLAVOR" >>"${SRCROOT}"/Flutter/Environment.xcconfig
fi

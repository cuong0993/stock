- Run create_gcp_project.sh
- Save service_account json file sa-$ENV_FLAVOR.json
- Run make
- Enable Firebase authentication by click get started in the web client
- Enable Google sign-in, change public-facing name
- Run config_firebase.sh
- Enable Apple Push Notification https://firebase.flutter.dev/docs/messaging/apple-integration, key file in private_keys/APN
- Run database/restore-firestore.sh
- Run functions/deploy_functions_and_rules.sh
- Run download_apps_config.sh to get google-services.json and GoogleService-Info.plist configuration files
- Add lifecycle to artifacts storage bucket to delete containers after 1 day to minimal storage price
- FIXME: Not sure why currently have to open storage tab in firebase to make service-<project number>@gcp-sa-firebasestorage.iam.gserviceaccount.com created and the storage works
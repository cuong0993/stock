resource "google_app_engine_application" "app" {
  project       = var.ENV_FIREBASE_APP_ID
  location_id   = var.ENV_FIREBASE_APP_REGION
  database_type = "CLOUD_FIRESTORE"

  depends_on = [
    google_project_service.services["appengine.googleapis.com"],
  ]
}

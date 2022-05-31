resource "google_app_engine_application" "app" {
  project       = var.ENV_GCP_PROJECT_ID
  location_id   = var.ENV_GCP_PROJECT_REGION
  database_type = "CLOUD_FIRESTORE"

  depends_on = [
    google_project_service.services["appengine.googleapis.com"],
  ]
}

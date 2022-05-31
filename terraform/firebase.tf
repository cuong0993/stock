provider "google-beta" {
  project     = var.ENV_GCP_PROJECT_ID
  region      = var.ENV_GCP_PROJECT_REGION
  credentials = file("${path.module}/sa-${var.ENV_FLAVOR}.json")
}

resource "google_firebase_project" "default" {
  provider = google-beta

  depends_on = [
    google_project_service.services["firebase.googleapis.com"],
  ]
}

resource "google_firebase_project_location" "default" {
  provider = google-beta

  location_id = var.ENV_GCP_PROJECT_REGION

  depends_on = [
    google_firebase_project.default,
  ]
}

resource "google_firebase_web_app" "basic" {
  provider     = google-beta
  project      = var.ENV_GCP_PROJECT_ID
  display_name = "Web"

  depends_on = [google_firebase_project.default]
}

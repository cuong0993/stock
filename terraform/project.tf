provider "google" {
  region      = var.ENV_FIREBASE_APP_REGION
  credentials = file("${path.module}/sa-${var.ENV_FLAVOR}.json")
}

terraform {
  backend "gcs" {
  }
}

resource "google_project_service" "resourcemanager" {
  project            = var.ENV_FIREBASE_APP_ID
  service            = "cloudresourcemanager.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "services" {
  project = var.ENV_FIREBASE_APP_ID
  for_each = toset([
    "firebase.googleapis.com",
    "appengine.googleapis.com",
    "firestore.googleapis.com",
    "cloudbuild.googleapis.com",
    "cloudfunctions.googleapis.com",
  ])
  service            = each.value
  disable_on_destroy = false

  depends_on = [
    google_project_service.resourcemanager,
  ]
}

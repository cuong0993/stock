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
    "run.googleapis.com",
    "drive.googleapis.com",
    "cloudscheduler.googleapis.com",
  ])
  service            = each.value
  disable_on_destroy = false

  depends_on = [
    google_project_service.resourcemanager,
  ]
}

resource "google_cloud_run_service" "default" {
  name     = "analyze-market-service"
  project  = var.ENV_FIREBASE_APP_ID
  location = var.ENV_FIREBASE_APP_REGION

  template {
    spec {
      containers {
        image = "gcr.io/${var.ENV_FIREBASE_APP_ID}/backend@sha256:9cf952f9c0ef4710622336483f58f367a442d2d1d78d33767c8a34412b6b626b"
      }
    }
  }

  depends_on = [
    google_project_service.services["run.googleapis.com"],
  ]

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_scheduler_job" "job" {
  name             = "analyze-market-job"
  description      = "Analyze Vietnam stock market every weekday at 6:00 PM"
  schedule         = "0 12,18 * * 1-5"
  time_zone        = "Asia/Ho_Chi_Minh"
  attempt_deadline = "320s"
  project          = var.ENV_FIREBASE_APP_ID

  retry_config {
    retry_count = 1
  }

  http_target {
    http_method = "GET"
    uri         = google_cloud_run_service.default.status[0].url
    oidc_token {
      service_account_email = "sa-dev@${var.ENV_FIREBASE_APP_ID}.iam.gserviceaccount.com"
    }
  }

  depends_on = [
    google_project_service.services["cloudscheduler.googleapis.com"],
  ]
}

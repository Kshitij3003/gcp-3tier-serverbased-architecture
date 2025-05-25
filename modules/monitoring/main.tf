resource "google_project_service" "monitoring" {
  service = "monitoring.googleapis.com"
  project = var.project_id
  disable_on_destroy = false
}

resource "google_project_service" "logging" {
  service = "logging.googleapis.com"
  project = var.project_id
  disable_on_destroy = false
}

# Optional: Log export sink to Cloud Storage
resource "google_logging_project_sink" "log_sink" {
  name        = "cloud-logs-to-bucket"
  project = var.project_id
  destination = "storage.googleapis.com/${var.bucket_name}"
  filter      = "resource.type=gce_instance OR resource.type=k8s_container"
  unique_writer_identity = true
}

# Grant sink permission to write logs to bucket
resource "google_storage_bucket_iam_member" "log_writer" {
  bucket = var.bucket_name
  role   = "roles/storage.objectCreator"
  member = "serviceAccount:${google_logging_project_sink.log_sink.writer_identity}"
  depends_on = [google_logging_project_sink.log_sink]
}

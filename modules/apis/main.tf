resource "google_project_service" "required" {
  project = var.project_id
  for_each = toset([
    "compute.googleapis.com",
    "container.googleapis.com",
    "sqladmin.googleapis.com",
    "servicenetworking.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "storage.googleapis.com",
    "cloudkms.googleapis.com",
    "apigateway.googleapis.com",
    "networkservices.googleapis.com",
    #"cloudcdn.googleapis.com"
  ])
  service = each.key
}
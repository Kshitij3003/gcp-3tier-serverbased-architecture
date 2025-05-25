resource "google_storage_bucket" "default" {
  name                        = var.bucket_name
  project = var.project
  location                    = var.location
  storage_class               = var.storage_class
  force_destroy               = true
  uniform_bucket_level_access = true
  versioning {
    enabled = var.enable_versioning
  }
  #deletion_protection = false
}

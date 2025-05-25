resource "google_sql_database_instance" "default" {
  name             = var.instance_name
  database_version = "POSTGRES_14"
  region           = var.region
  project = var.project_id
  deletion_protection = false

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "default" {
  name     = var.db_name

  project     = var.project_id
  instance = google_sql_database_instance.default.name
}

module "enable_apis" {
  source = "../../modules/apis"
  project_id = var.project_id
}

module "vpc" {
  source       = "../../modules/vpc"
  project_id = var.project_id
  vpc_name     = var.vpc_name
  subnet_name  = var.subnet_name
  subnet_range = var.subnet_range
  region       = var.region
  pods_range_name       = "gke-pods-range"
  pods_ip_range         = "10.3.0.0/16"
  services_range_name   = "gke-services-range"
  services_ip_range     = "10.2.0.0/20"
}

resource "random_id" "suffix" {
  byte_length = 4
}


module "logs_bucket" {
  source             = "../../modules/bucket"
  bucket_name        = "dev-logs-export-bucket-${random_id.suffix.hex}"
  project            = var.project
  location           = var.region
  storage_class      = var.storage_class
  enable_versioning  = var.enable_versioning
}

module "gke" {
  source              = "../../modules/gke"
  name                = "dev-cluster"
  region              = var.region
  network             = module.vpc.vpc_name
  subnetwork          = module.vpc.subnet_name
  project_id          = var.project_id
  pods_range_name     = module.vpc.pods_range_name
  services_range_name = module.vpc.services_range_name
  min_nodes           = 1
  max_nodes           = 3
  node_count          = 1
  env                 = "dev"
  tags                = ["dev", "gke"]
  disk_size_gb       = 15
}

module "cloudsql" {
  source         = "../../modules/cloudsql"
  instance_name  = "dev-postgres"
  project_id     = var.project_id
  db_name        = "appdb"
  region         = var.region
}



#monitoring
# module "logging_monitoring" {
#   source      = "../../modules/monitoring"
#   project_id = var.project_id
#   bucket_name = module.logs_bucket.bucket_name
# }



variable "name" {}
variable "region" {}
variable "network" {}
variable "subnetwork" {}
variable "project_id" {}

variable "pods_range_name" {}
variable "services_range_name" {}

variable "machine_type" {
  default = "e2-medium"
}
variable "node_count" {
  default = 1
}
variable "min_nodes" {
  default = 1
}
variable "max_nodes" {
  default = 3
}
variable "env" {
  default = "dev"
}
variable "tags" {
  default = []
}

variable "disk_size_gb" {
  description = "Boot disk size in GB for each GKE node"
  type        = number
  default     = 20
}



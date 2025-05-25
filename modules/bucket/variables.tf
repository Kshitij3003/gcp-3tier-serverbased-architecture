variable "project" {
    description = "The ID of the GCP project."
    type        = string
}
variable "bucket_name" {}
variable "location" {
  default = "ASIA"
}
variable "storage_class" {
  default = "STANDARD"
}
variable "enable_versioning" {
  default = false
}

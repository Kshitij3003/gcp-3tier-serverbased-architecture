variable "project_id" {
    description = "The ID of the GCP project."
    type        = string
}

#VPC Modules

variable "vpc_name" {
    description = "The name of the VPC network."
    type        = string
}

variable "pods_range_name" {}
variable "pods_ip_range" {}
variable "services_range_name" {}
variable "services_ip_range" {}


variable "subnet_name" {
    description = "The name of the subnet."
    type        = string
}

variable "subnet_range" {
    description = "The IP range (CIDR) for the subnet."
    type        = string
}

variable "region" {
    description = "The GCP region where resources will be created."
    type        = string
}

#Cloud Bucket variable

variable "project" {
    description = "The ID of the GCP project."
    type        = string
}

variable "bucket_name" {
    description = "The name of the Cloud Storage bucket."
    type        = string
}

variable "location" {
    description = "The location for the Cloud Storage bucket."
    type        = string
    default     = "ASIA"
}

variable "storage_class" {
    description = "The storage class of the Cloud Storage bucket."
    type        = string
    default     = "STANDARD"
}

variable "enable_versioning" {
    description = "Enable versioning for the Cloud Storage bucket."
    type        = bool
    default     = false
}


#CloudSQL
// Name of the compute instance to be created.
// Type: string
//
// Name of the database to be created.
// Type: string
variable "instance_name" {}
variable "db_name" {}

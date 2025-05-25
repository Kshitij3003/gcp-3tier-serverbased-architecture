variable "project_id" {
    description = "The ID of the GCP project."
    type        = string
}


variable "vpc_name" {
    description = "The name of the VPC network."
    type        = string
}

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

variable "pods_range_name" {}
variable "pods_ip_range" {}
variable "services_range_name" {}
variable "services_ip_range" {}
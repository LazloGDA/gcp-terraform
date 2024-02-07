
variable "project" {
  description = "The project where the resources will be created"
  default     = "gcp-terraform-2-413609"
}

variable "default_region" {
  description = "The region where the resources will be created"
  default     = "europe-west1"
}

variable "default_zone" {
  description = "The zone where the resources will be created"
  default     = "europe-west1-c"
}

variable "instance_zone" {
  description = "The zone where the resources will be created"
}

variable "machine_type" {
  description = "The machine type of the instance"
  default     = "e2-micro"
}

variable "image" {
  description = "The type of image"
  default     = "debian-cloud/debian-10"
}
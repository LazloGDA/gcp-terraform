variable "name" {
  description = "Name of the instance. Must be unique."
  type        = string
}

variable "zone" {
  description = "The zone where the resources will be created"
  default     = "europe-west1-c"
}

variable "machine_type" {
  description = "The machine type of the instance"
  default     = "e2-micro"
}

variable "image" {
  description = "The type of image"
  default     = "debian-cloud/debian-10"
}

variable "labels" {
  description = "Labels to set on the instance."
  type        = map(string)
  default     = {}
}

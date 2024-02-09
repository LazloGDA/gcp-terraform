provider "google" {
    project = var.project
    credentials = "${file("./credentials/credentials.json")}"
    region = var.default_region
    zone = var.default_zone
}

resource "google_compute_instance" "terraform-vm-1" {
    name = "terraform-vm-1"
    machine_type = var.machine_type
    zone = var.instance_zone
    
    boot_disk {
      initialize_params {
        image = var.image
      }
    }
    network_interface {
      network = "default"
      access_config {
        // neccessary even empty, ensure the availability over the internet
      }
    }
    
    scheduling {
      preemptible = true
      automatic_restart = false
    }
}

module "module-instance-1" {
  source = "./modules/compute_instance"
  name = "module-instance-1"
  labels = {"app" = "frontend"}
}

module "module-instance-2" {
  source = "./modules/compute_instance"
  name = "module-instance-2"
  labels = {"app" = "backend"}
}

variable "bucket_names" {
  type = list(string)
  default = ["lazlo-log-bucket-42", "lazlo-image-bucket-42"]
}

resource "google_storage_bucket" "example" {
  for_each = toset(var.bucket_names)
  name     = each.key
  location = "EU"
}

# resource "google_sql_database_instance" "my-db-1" {
#     name = "lazlo-db-instance"
#     database_version = "MYSQL_8_0"
#     region = "europe-west10"
# 
#     settings {
#       tier = "db-g1-small"
#     }
#   
# }
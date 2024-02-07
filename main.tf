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
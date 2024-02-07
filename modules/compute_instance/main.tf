resource "google_compute_instance" "instance" {
    name = var.name
    machine_type = var.machine_type
    zone = var.zone
    labels = var.labels

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
provider "google" {
  project = "driven-backbone-415804"
  region  = "us-central1"  # Change to your desired region
}

resource "google_compute_instance" "default" {
  name         = var.vmName
  machine_type = var.MachineType
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
}

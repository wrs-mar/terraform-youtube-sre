locals {

  network_name = "microservicos"
  subnet_name  = "${google_compute_network.vpc.name}-subnet"


}

resource "google_compute_network" "vpc" {
  name                            = local.network_name
  auto_create_subnetworks         = false
  routing_mode                    = "GLOBAL"
  delete_default_routes_on_create = true

}

resource "google_compute_subnetwork" "subnet" {
  ip_cidr_range            = var.prefix[0]
  name                     = local.subnet_name
  network                  = google_compute_network.vpc.name
  private_ip_google_access = true
  region                   = var.region
}

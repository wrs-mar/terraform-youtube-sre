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

resource "google_compute_router" "router" {
  name    = "${local.network_name}-router"
  network = google_compute_network.vpc.name
  region  = google_compute_subnetwork.subnet.region
}

resource "google_compute_router_nat" "nat_router" {
  name                               = "${google_compute_subnetwork.subnet.name}-nat-router"
  nat_ip_allocate_option             = "AUTO_ONLY"
  router                             = google_compute_router.router.name
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = google_compute_subnetwork.subnet.name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

}

resource "google_compute_route" "egress_internet" {
  dest_range = "0.0.0.0/0"
  name       = "egress-internet"
  network    = google_compute_network.vpc.name
  next_hop_gateway = "default-internet-gateway"
}

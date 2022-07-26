# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
resource "google_compute_subnetwork" "gke_private" {
  name                     = "gke-private"
  ip_cidr_range            = "10.0.0.0/18"
  region                   = "asia-southeast1"
  network                  = google_compute_network.gke_vpc.id
  private_ip_google_access = true

  secondary_ip_range = [{
    range_name    = "k8s-pod-range"
    ip_cidr_range = "10.48.0.0/14"
    }, {
    range_name    = "k8s-service-range"
    ip_cidr_range = "10.52.0.0/20"
  }]
}

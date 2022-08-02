resource "google_service_account" "gke_service_account" {
  account_id   = "${var.service_account_id}"
  description  = "Least priviliged Service Account for GKE"
  display_name = "${var.service_account_display_name}"
}

## TODO Add other SA below

output "gke_service_account_email" {
  value = google_service_account.gke_service_account.email
}

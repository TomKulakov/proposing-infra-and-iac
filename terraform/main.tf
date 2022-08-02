provider "google" {
  project = var.project
  region  = var.region
}

resource "google_project_service" "gcp_iam_api" {
  project = var.project
  service = "iam.googleapis.com"

  disable_on_destroy = false
  disable_dependent_services = false
}

module "service_accounts" {
  source               = "./modules/service_accounts"
  project              = var.project
  service_account_id   = var.service_account_id

  depends_on = [
    google_project_service.gcp_iam_api,
  ]
}

module "cloudsql_gke_gift_card_app" {
  source               = "./modules/cloudsql_gke_gift_card_app"
  project              = var.project
  environment          = var.environment
  cloud_sql_instance_tier  = cloud_sql_instance_tier
}

module "gke_gift_card_app" {
  source               = "./modules/gke_gift_card_app"
  project              = var.project
  environment          = var.environment
  service_account      = module.service_accounts.gke_service_account_email

  depends_on = [
      module.service_accounts,
  ]
}

resource "google_sql_database" "database" {
  name     = "${cloud_sql_db_name_gift_card_app}"
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_database_instance" "instance" {
  name             = "gift_card_instance"
  region           = "us-central1"
  database_version = "MYSQL_8_0"
  settings {
    tier = "${var.cloud_sql_instance_tier}"
  }

  deletion_protection  = "true"
}

resource "google_sql_database_instance" "recipy_instance" {
  name             = local.database_instance_name
  database_version = "POSTGRES_15"
  settings {
    tier              = "db-f1-micro" # This machine type is only for testing purposes
    availability_type = "REGIONAL"
    disk_size         = 10 # 10 GB is the smallest disk size
    ip_configuration {
      ipv4_enabled    = false
      private_network = data.terraform_remote_state.network.outputs.recipy_vpc_id
    }
    database_flags {
      name  = "cloudsql.iam_authentication"
      value = "on"
    }
  }

  deletion_protection = "false"
}

resource "google_sql_database" "database" {
  name     = local.database_name
  instance = google_sql_database_instance.recipy_instance.name
}

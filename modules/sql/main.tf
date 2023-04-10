resource "google_sql_database_instance" "main" {
  name              = "${var.project_id}-${var.db_name}"
  database_version = var.db_version
  region            = var.region
  settings {
    tier = var.db_tier
    backup_configuration {
      enabled = true
    }
    ip_configuration {
      ipv4_enabled   = true
      require_ssl    = true
      authorized_networks {
        name   = "default"
        value  = "0.0.0.0/0"
      }
    }
    disk_size = var.db_disk_size
    availability_type = "REGIONAL"
    replication_type = "SYNCHRONOUS"
  }
}

resource "google_sql_database" "main" {
  count             = var.db_replica_count + 1
  name              = "${google_sql_database_instance.main.name}-${count.index}"
  instance          = google_sql_database_instance.main.name
  charset           = "utf8"
  collation         = "utf8_unicode_ci"
}

resource "google_sql_user" "main" {
  name     = var.db_user
  instance = google_sql_database_instance.main.name
  password = var.db_password
  host     = "%"
  depends_on = [
    google_sql_database.main
  ]
}

output "database_instance_name" {
  value = google_sql_database_instance.main.name
}
provider "google" {
  project = var.project_id
  region  = var.region
}

module "sql" {
  source           = "./modules/sql"
  project_id       = var.project_id
  region           = var.region
  db_name          = var.db_name
  db_user          = var.db_user
  db_password      = var.db_password
  db_tier          = var.db_tier
  db_version       = var.db_version
  db_disk_size     = var.db_disk_size
  db_replica_count = var.db_replica_count
}
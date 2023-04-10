terraform {
  backend "gcs" {
    bucket = "bkt-b-tfstate-00df"
    prefix = "terraform/sql-ha/state"
  }
}
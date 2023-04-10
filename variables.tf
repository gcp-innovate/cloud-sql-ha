variable "project_id" {
  type        = string
  description = "The ID of the Google Cloud project."
}

variable "region" {
  type        = string
  description = "The region in which to deploy the resources."
}

variable "db_name" {
  type        = string
  description = "The name of the database to create."
}

variable "db_user" {
  type        = string
  description = "The username to create for the database."
}

variable "db_password" {
  type        = string
  description = "The password to set for the database user."
}

variable "db_tier" {
  type        = string
  description = "The machine type for the SQL instance."
}

variable "db_version" {
  type        = string
  description = "The version of the Cloud SQL instance to create."
}

variable "db_disk_size" {
  type        = number
  description = "The size of the disk in GB."
}

variable "db_replica_count" {
  type        = number
  description = "The number of read replicas to create for the Cloud SQL instance."
}
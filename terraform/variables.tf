locals {
  data_lake_bucket = "belvo_challenge"
}

variable "project" {
  description = "dbtlab-371120"
}

variable "region" {
  default = "southamerica-east1"
  type = string
}

variable "storage_class" {
  default = "STANDARD"
}

variable "BQ_DATASET" {
  type = string
  default = "belvo_challenge"
}

variable "RAW_BQ_DATASET" {
  type = string
  default = "raw_belvo_challenge"
}
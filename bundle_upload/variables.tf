variable "gcp_project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "log_data_v1_service_account" {
  description = "Service account for shared flow"
  type        = string
}

variable "sharedflows" {
  description = "Map of shared flow names to their respective config bundles"
  type        = map(string)
}

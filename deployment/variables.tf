variable "gcp_project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "environments" {
  type        = list(string)
  description = "List of Apigee environments where shared flows will be deployed"
}

variable "sharedflows" {
  type = map(string)
  description = "Map of shared flow names to their respective config bundles"
}

variable "service_accounts" {
  type        = map(string)
  description = "Map of shared flows that require a service account"
}

variable "sharedflow_revisions" {
  type        = map(string)
  description = "Map of shared flow names to their respective revision numbers"
}

locals {
  service_accounts = var.service_accounts
}

# Shared flow creation
resource "google_apigee_sharedflow" "sharedflow" {
  for_each      = var.sharedflows
  name          = each.key
  org_id        = var.gcp_project_id
  config_bundle = each.value

  lifecycle {
    create_before_destroy = true
  }
}

# Deployments for shared flows with service accounts
resource "google_apigee_sharedflow_deployment" "sharedflow_deployment_with_sa" {
  for_each = {
    for flow, sa in var.service_accounts : flow => sa if contains(keys(var.service_accounts), flow)
  }

  environment   = var.environments[0]
  org_id        = var.gcp_project_id
  revision      = var.sharedflow_revisions[each.key]
  sharedflow_id = google_apigee_sharedflow.sharedflow[each.key].name
  service_account = each.value

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    google_apigee_sharedflow.sharedflow["log-data-v1"],
    google_apigee_sharedflow.sharedflow["cybersecurity-monitoring-dispatch"]
  ]
}

# Deployments for shared flows without service accounts
resource "google_apigee_sharedflow_deployment" "sharedflow_deployment_without_sa" {
  for_each = {
    for flow in keys(var.sharedflows) : flow => var.sharedflows[flow] if !contains(keys(var.service_accounts), flow)
  }

  environment   = var.environments[1]
  org_id        = var.gcp_project_id
  revision      = var.sharedflow_revisions[each.key]
  sharedflow_id = google_apigee_sharedflow.sharedflow[each.key].name

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    google_apigee_sharedflow.sharedflow["pre-proxy-v1"],
    google_apigee_sharedflow.sharedflow["pre-target-v1"],
    google_apigee_sharedflow.sharedflow["post-target-v1"],
    google_apigee_sharedflow.sharedflow["post-proxy-v1"],
    google_apigee_sharedflow.sharedflow["log-error-values"],
    google_apigee_sharedflow.sharedflow["cybersecurity-monitoring-collect"]
  ]
}

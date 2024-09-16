resource "google_apigee_sharedflow" "sharedflows" {
  for_each       = var.sharedflows
  name           = each.key
  org_id         = var.gcp_project_id
  config_bundle  = each.value
  lifecycle {
    create_before_destroy = true
  }
}

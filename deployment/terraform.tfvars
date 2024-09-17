gcp_project_id = "worstation-379213"

environments = [
  "dev",
  "eval"
]

sharedflows = {
  "log-data-v1"                       = "SharedFlows/log-data-v1.zip"
  "pre-proxy-v1"                      = "SharedFlows/pre-proxy-v1.zip"
  "pre-target-v1"                     = "SharedFlows/pre-target-v1.zip"
  "post-target-v1"                    = "SharedFlows/post-target-v1.zip"
  "post-proxy-v1"                     = "SharedFlows/post-proxy-v1.zip"
  "log-error-values"                  = "SharedFlows/log-error-values.zip"
  "cybersecurity-monitoring-collect"  = "SharedFlows/CyberSecurity-Monitoring-Collect.zip"
  "cybersecurity-monitoring-dispatch" = "SharedFlows/CyberSecurity-Monitoring-Dispatch.zip"
}

service_accounts = {
  "log-data-v1"                       = "sa-apimgmt-log-data-vert03-pp@worstation-379213.iam.gserviceaccount.com"
  "cybersecurity-monitoring-dispatch"  = "sa-apimgmt-log-data-vert03-pp@worstation-379213.iam.gserviceaccount.com"
}

sharedflow_revisions = {
  "log-data-v1"                       = "1"
  "pre-proxy-v1"                      = "2"
  "pre-target-v1"                     = "3"
  "post-target-v1"                    = "4"
  "post-proxy-v1"                     = "5"
  "log-error-values"                  = "6"
  "cybersecurity-monitoring-collect"  = "7"
  "cybersecurity-monitoring-dispatch" = "8"
}

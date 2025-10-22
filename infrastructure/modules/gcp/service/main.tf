data "google_sql_database_instance" "db" {
  project = var.project_id
  name    = var.cloudsql_instance_name
}

module "cloud-run-service" {
  source = "git@github.com:owi-link/terraform-gcp-cloud-run-service.git?ref=v1.0.0"

  project_id             = var.project_id
  project_name           = var.project_name
  service_name           = var.service_name
  env                    = var.env
  region                 = var.region
  service_port           = var.service_port
  subdomain              = var.subdomain
  service_startup_probe  = var.service_startup_probe
  service_liveness_probe = var.service_liveness_probe
  image                  = "us-docker.pkg.dev/cloudrun/container/hello" # TODO: CICD module (CodeDeploy, ClouBuild, Artifact Registry)
  cpu                    = var.cpu
  memory                 = var.memory
  min_instances          = var.min_instances
  max_instances          = var.max_instances
  env_vars               = var.env_vars
  secrets                = var.secrets
  allow_unauthenticated  = var.allow_unauthenticated
  ingress_mode           = var.ingress_mode
  cloudsql_instance_name = data.google_sql_database_instance.db.connection_name
  enable_http_traffic    = var.enable_http_traffic
}

resource "google_artifact_registry_repository" "service" {
  count = var.is_primary_region ? 1 : 0

  project       = var.project_id
  location      = var.region
  repository_id = "${var.project_name}-${var.service_name}"
  format        = "DOCKER"

  docker_config {
    immutable_tags = true
  }

  vulnerability_scanning_config {
    enablement_config = "DISABLED"
  }
}

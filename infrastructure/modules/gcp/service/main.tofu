module "cloud-run-service" {
  source = "/Users/luismoreira/Workspace/terraform-gcp-cloud-run-service" # TODO: Change me when ready

  project_id            = var.project_id
  service_name          = var.service_name
  env                   = var.env
  region                = var.region
  service_port          = var.service_port
  service_startup_probe = var.service_startup_probe
  # image         = "${google_artifact_registry_repository.cloud_run_service.registry_uri}/custom-unleash" # TODO: Output of the CICD module (ClouBuild, Artifact Registry)
  image         = "us-docker.pkg.dev/cloudrun/container/hello"
  cpu           = var.cpu
  memory        = var.memory
  min_instances = var.min_instances
  max_instances = var.max_instances
  secrets       = var.secrets
}

resource "google_artifact_registry_repository" "cloud_run_service" {
  project       = var.project_id
  location      = var.region
  repository_id = var.service_name
  format        = "DOCKER"

  docker_config {
    immutable_tags = true
  }

  vulnerability_scanning_config {
    enablement_config = "DISABLED"
  }
}

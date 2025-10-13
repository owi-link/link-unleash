# ==== Defaults (can be overridden by env/region) ====
locals {
  env_cfg = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  defaults = {
    service_name          = "unleash"
    cpu                   = 1
    memory                = "1Gi"
    min_instances         = 1
    max_instances         = 5
    service_port          = 4242
    allow_unauthenticated = true
    ingress_mode          = "INGRESS_TRAFFIC_ALL"
    service_domain        = "luis3m-unleash.liminal.co"
    env_vars = [
      {
        name  = "UNLEASH_DISABLE_DB_MIGRATION"
        value = "false"
      },
      {
        name  = "UNLEASH_URL"
        value = "https://features.liminal-infra.com"
      }
    ]
    secrets = [
      {
        env_var     = "UNLEASH_SECRET"
        secret_name = "unleash-secret"
      },
      {
        env_var     = "DB_USER"
        secret_name = "db-user"
      },
      {
        env_var     = "DB_PASSWORD"
        secret_name = "db-password"
      }
    ]
  }
}

remote_state {
  backend = "gcs"
  config = {
    project  = local.env_cfg.locals.env_overrides.project_id
    bucket   = "link-${local.env_cfg.locals.env_overrides.env}-tf-state"
    prefix   = "${local.defaults.service_name}/${path_relative_to_include()}"
    location = "US"
  }
  generate = {
    path      = "${local.defaults.service_name}-backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

generate "providers" {
  path      = "providers.tf"
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
  required_providers {
    google = {
      source = "hashicorp/google",
      version = "~> 7.6.0"
    }
    google-beta = {
      source = "hashicorp/google-beta",
      version = "~> 7.6.0"
    }
  }
}

provider "google" {
  default_labels = {
    project     = var.project_id
    env         = var.env
    region      = var.region
    app         = var.service_name
    managed_by  = "terraform"
  }
}
provider "google-beta" {
  default_labels = {
    project     = var.project_id
    env         = var.env
    region      = var.region
    app         = var.service_name
    managed_by  = "terraform"
  }
}
EOF
}

terraform {
  source = "${get_repo_root()}/infrastructure/modules/gcp/service"
}

inputs = local.defaults

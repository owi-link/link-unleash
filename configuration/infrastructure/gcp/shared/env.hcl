locals {
  env_overrides = {
    project_id   = "link-app-438915"
    project_name = "link"
    env          = basename(get_terragrunt_dir())
  }
}

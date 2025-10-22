locals {
  region_overrides = {
    region            = basename(get_terragrunt_dir())
    is_primary_region = true
  }
}

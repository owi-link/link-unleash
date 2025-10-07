# Include exactly one parent: the ROOT
include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

# Read env overrides sitting one level up. If the file doesn't exist, use {}.
locals {
  env_cfg    = read_terragrunt_config("${get_terragrunt_dir()}/../env.hcl")
  region_cfg = read_terragrunt_config("${get_terragrunt_dir()}/region.hcl")
}

# Merge order: root defaults < env overrides < region overrides
inputs = merge(
  include.root.inputs,                     # root defaults
  local.env_cfg.locals.env_overrides,      # env-wide overrides
  local.region_cfg.locals.region_overrides # region overrides
)

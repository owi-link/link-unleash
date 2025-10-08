# service

<!-- BEGINNING OF PRE-COMMIT-OPENTOFU DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 7.6.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloud-run-service"></a> [cloud-run-service](#module\_cloud-run-service) | /Users/luismoreira/Workspace/terraform-gcp-cloud-run-service | n/a |

## Resources

| Name | Type |
|------|------|
| [google_artifact_registry_repository.cloud_run_service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/artifact_registry_repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cpu"></a> [cpu](#input\_cpu) | n/a | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | n/a | `string` | n/a | yes |
| <a name="input_env_vars"></a> [env\_vars](#input\_env\_vars) | n/a | <pre>list(object({<br/>    name  = string<br/>    value = string<br/>  }))</pre> | `[]` | no |
| <a name="input_max_instances"></a> [max\_instances](#input\_max\_instances) | n/a | `number` | n/a | yes |
| <a name="input_memory"></a> [memory](#input\_memory) | n/a | `string` | n/a | yes |
| <a name="input_min_instances"></a> [min\_instances](#input\_min\_instances) | n/a | `number` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | n/a | <pre>list(object({<br/>    env_var     = string<br/>    secret_name = string<br/>  }))</pre> | `[]` | no |
| <a name="input_service_liveness_probe"></a> [service\_liveness\_probe](#input\_service\_liveness\_probe) | n/a | `any` | `null` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | n/a | `string` | n/a | yes |
| <a name="input_service_port"></a> [service\_port](#input\_service\_port) | n/a | `number` | n/a | yes |
| <a name="input_service_startup_probe"></a> [service\_startup\_probe](#input\_service\_startup\_probe) | n/a | `any` | `{}` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-OPENTOFU DOCS HOOK -->

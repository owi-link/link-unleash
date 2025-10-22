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
| <a name="module_cloud-run-service"></a> [cloud-run-service](#module\_cloud-run-service) | git@github.com:owi-link/terraform-gcp-cloud-run-service.git | v1.0.0 |

## Resources

| Name | Type |
|------|------|
| [google_artifact_registry_repository.service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/artifact_registry_repository) | resource |
| [google_sql_database_instance.db](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/sql_database_instance) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_unauthenticated"></a> [allow\_unauthenticated](#input\_allow\_unauthenticated) | n/a | `bool` | n/a | yes |
| <a name="input_cloudsql_instance_name"></a> [cloudsql\_instance\_name](#input\_cloudsql\_instance\_name) | n/a | `string` | n/a | yes |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | n/a | `string` | n/a | yes |
| <a name="input_enable_http_traffic"></a> [enable\_http\_traffic](#input\_enable\_http\_traffic) | n/a | `bool` | `false` | no |
| <a name="input_env"></a> [env](#input\_env) | n/a | `string` | n/a | yes |
| <a name="input_env_vars"></a> [env\_vars](#input\_env\_vars) | n/a | <pre>list(object({<br/>    name  = string<br/>    value = string<br/>  }))</pre> | `[]` | no |
| <a name="input_ingress_mode"></a> [ingress\_mode](#input\_ingress\_mode) | n/a | `string` | n/a | yes |
| <a name="input_is_primary_region"></a> [is\_primary\_region](#input\_is\_primary\_region) | n/a | `bool` | n/a | yes |
| <a name="input_max_instances"></a> [max\_instances](#input\_max\_instances) | n/a | `number` | n/a | yes |
| <a name="input_memory"></a> [memory](#input\_memory) | n/a | `string` | n/a | yes |
| <a name="input_min_instances"></a> [min\_instances](#input\_min\_instances) | n/a | `number` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | n/a | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | n/a | <pre>list(object({<br/>    env_var     = string<br/>    secret_name = string<br/>    existing    = optional(bool, false)<br/>  }))</pre> | `[]` | no |
| <a name="input_service_liveness_probe"></a> [service\_liveness\_probe](#input\_service\_liveness\_probe) | n/a | `any` | `null` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | n/a | `string` | n/a | yes |
| <a name="input_service_port"></a> [service\_port](#input\_service\_port) | n/a | `number` | n/a | yes |
| <a name="input_service_startup_probe"></a> [service\_startup\_probe](#input\_service\_startup\_probe) | n/a | `any` | `{}` | no |
| <a name="input_subdomain"></a> [subdomain](#input\_subdomain) | n/a | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_details"></a> [service\_details](#output\_service\_details) | n/a |
<!-- END OF PRE-COMMIT-OPENTOFU DOCS HOOK -->

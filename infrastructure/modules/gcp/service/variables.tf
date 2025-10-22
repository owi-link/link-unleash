variable "project_id" {
  type = string
}

variable "project_name" {
  type = string
}

variable "region" {
  type = string
}

variable "is_primary_region" {
  type = bool
}

variable "service_name" {
  type = string
}

variable "env" {
  type = string
}

variable "service_port" {
  type = number
}

variable "subdomain" {
  type    = string
  default = null
}

variable "ingress_mode" {
  type = string
}

variable "allow_unauthenticated" {
  type = bool
}

variable "service_startup_probe" {
  type    = any
  default = {}
}

variable "service_liveness_probe" {
  type    = any
  default = null
}

variable "cpu" {
  type = string
}

variable "memory" {
  type = string
}

variable "min_instances" {
  type = number
}

variable "max_instances" {
  type = number
}

variable "env_vars" {
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "secrets" {
  type = list(object({
    env_var     = string
    secret_name = string
    existing    = optional(bool, false)
  }))
  default = []
}

variable "cloudsql_instance_name" {
  type = string
}

variable "enable_http_traffic" {
  type    = bool
  default = false
}

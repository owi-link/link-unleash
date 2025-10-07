variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "service_name" {
  type = string
}

variable "env" {
  type = string
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
  }))
  default = []
}

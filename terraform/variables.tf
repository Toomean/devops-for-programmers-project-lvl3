variable "do_token" {}
variable "pvt_key" {}
variable "ssh_key" {
  type = string
}
variable "subdomain" {
  type = string
}
variable "domain_name" {
  type = string
}

variable "name" {
  type    = string
  default = "hexlet-project-3"
}

variable "region" {
  type    = string
  default = "ams3"
}

variable "web_droplet_count" {
  type    = number
  default = 1
}

variable "web_droplet_image" {
  type    = string
  default = "docker-20-04"
}

variable "web_droplet_size" {
  type    = string
  default = "s-1vcpu-1gb"
}

variable "web_db_type" {
  type    = string
  default = "pg"
}

variable "web_db_version" {
  type    = string
  default = "11"
}

variable "web_db_size" {
  type    = string
  default = "db-s-1vcpu-1gb"
}

variable "datadog_api_key" {
  type = string
}
variable "datadog_app_key" {
  type = string
}
variable "datadog_api_url" {
  type = string
}

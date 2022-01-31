# General vars
variable "general_project_name" {
  default = "devops-lvl3"
}

variable "general_domain" {
  default = "devops-lvl3.strangeman.info"
}

# DigitalOcean general
variable "do_region" {
  default = "ams3"
}

# DigitalOcean droplets
variable "do_droplet_size" {
  default = "s-1vcpu-1gb"
}

variable "do_droplet_image" {
  default = "docker-20-04"
}

# DigitalOcean database
variable "do_database_size" {
  default = "db-s-1vcpu-1gb"
}

# Cloudflare DNS
variable "cloudflare_zone_id" {
  default = "afe9bf4453f4bab98e341414012f229f"
}
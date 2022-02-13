terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }

    datadog = {
      source = "DataDog/datadog"
    }
  }
}

variable "do_token" {}

variable "cloudflare_email" {}
variable "cloudflare_api_token" {}

variable "pvt_key" {}

variable "datadog_api_key" {}
variable "datadog_app_key" {}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "terraform" {
  name = "strangeman@debian-work"
}

provider "cloudflare" {
  email     = var.cloudflare_email
  api_token = var.cloudflare_api_token
}

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
  api_url = "https://api.datadoghq.eu/"
}

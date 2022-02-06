terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

variable "do_token" {}
# variable "ssh_private_key" {}
variable "cloudflare_email" {}
variable "cloudflare_api_token" {}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "terraform" {
  name = "strangeman@debian-work"
}

provider "cloudflare" {
  email   = var.cloudflare_email
  api_token = var.cloudflare_api_token
}
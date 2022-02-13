resource "digitalocean_certificate" "cert" {
  name    = "${var.general_project_name}-cert"
  type    = "lets_encrypt"
  domains = ["${var.general_domain}"]
}

resource "digitalocean_loadbalancer" "public" {
  name   = "${var.general_project_name}-lb"
  region = var.do_region

  forwarding_rule {
    entry_port     = 443
    entry_protocol = "https"

    target_port     = 5000
    target_protocol = "http"

    certificate_name = digitalocean_certificate.cert.name
  }

  healthcheck {
    port     = 5000
    protocol = "tcp"
  }

  droplet_ids = digitalocean_droplet.backends.*.id
}
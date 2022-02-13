resource "cloudflare_record" "domain" {
  zone_id = var.cloudflare_zone_id
  name    = var.general_project_name
  value   = digitalocean_loadbalancer.public.ip
  type    = "A"
  ttl     = 1

  lifecycle {
    create_before_destroy = true
  }
  depends_on = [
    digitalocean_loadbalancer.public
  ]
}
resource "digitalocean_droplet" "backends" {
  count              = 2
  image              = "${var.do_droplet_image}"
  name               = "${var.general_project_name}-server-${count.index + 1}"
  region             = "${var.do_region}"
  size               = "${var.do_droplet_size}"
  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]
}

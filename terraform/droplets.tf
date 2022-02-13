resource "digitalocean_droplet" "backends" {
  count              = 2
  image              = "${var.do_droplet_image}"
  name               = "${var.general_project_name}-server-${count.index + 1}"
  region             = "${var.do_region}"
  size               = "${var.do_droplet_size}"
  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]

  provisioner "remote-exec" {
    inline = ["sudo apt update", "sudo apt install python3 -y", "echo Done!"]

    connection {
      host        = self.ipv4_address
      type        = "ssh"
      user        = "root"
      private_key = file(var.pvt_key)
    }
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i '${self.ipv4_address},' -e 'redmine_db_host=${digitalocean_database_cluster.postgres.host}' -e 'redmine_db_port=${digitalocean_database_cluster.postgres.port}' -e 'redmine_db_username=${digitalocean_database_cluster.postgres.user}' -e 'redmine_db_name=${digitalocean_database_cluster.postgres.database}' -e 'redmine_db_password=${digitalocean_database_cluster.postgres.password}' -e 'datadog_api_key=${var.datadog_api_key}' --private-key ${var.pvt_key} ../ansible/playbook.yml"
  }
}
output "droplet_ip_addresses" {
  value = {
    for droplet in digitalocean_droplet.backends:
    droplet.name => droplet.ipv4_address
  }
}
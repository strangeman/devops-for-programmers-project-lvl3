resource "digitalocean_database_db" "database" {
  cluster_id = digitalocean_database_cluster.postgres.id
  name       = "${var.general_project_name}-db"

  lifecycle {
    create_before_destroy = true
  }
}

resource "digitalocean_database_cluster" "postgres" {
  name       = "${var.general_project_name}-postgres"
  engine     = "pg"
  version    = "11"
  size       = var.do_database_size
  region     = var.do_region
  node_count = 1
}

resource "digitalocean_droplet" "web" {
  count = var.web_droplet_count

  name = "web-${ var.name }-${ var.region }-${ count.index + 1 }"

  region = var.region
  image  = var.web_droplet_image
  size   = var.web_droplet_size

  ssh_keys = [data.digitalocean_ssh_key.main.id]

  tags = ["${ var.name }-web"]

  lifecycle {
    create_before_destroy = true
  }
}

resource "digitalocean_certificate" "web" {
  name = "${ var.name }-certificate"

  type = "lets_encrypt"

  domains = ["${ var.subdomain }.${ data.digitalocean_domain.web.name }"]

  lifecycle {
    create_before_destroy = true
  }
}

resource "digitalocean_loadbalancer" "web" {
  name        = "web-${ var.region }-loadbalancer"
  region      = var.region
  droplet_ids = digitalocean_droplet.web.*.id

  redirect_http_to_https = true

  forwarding_rule {
    entry_port     = 443
    entry_protocol = "https"

    target_port     = 80
    target_protocol = "http"

    certificate_id = digitalocean_certificate.web.id
  }

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"

    certificate_id = digitalocean_certificate.web.id
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "digitalocean_record" "web" {
  domain = data.digitalocean_domain.web.name
  type   = "A"
  name   = var.subdomain
  value  = digitalocean_loadbalancer.web.ip
  ttl    = 300
}

resource "digitalocean_database_db" "web" {
  cluster_id = digitalocean_database_cluster.web.id
  name       = "web-${ var.region }-${ var.web_db_type }-database"
}

resource "digitalocean_database_cluster" "web" {
  name       = "web-${ var.region }-${ var.web_db_type }-cluster"
  engine     = var.web_db_type
  version    = var.web_db_version
  size       = var.web_db_size
  region     = var.region
  node_count = 1
}
terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    datadog = {
      source  = "DataDog/datadog"
      version = "~> 3.2.0"
    }
  }
}

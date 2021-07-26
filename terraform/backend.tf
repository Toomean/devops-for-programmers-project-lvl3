terraform {
  backend "remote" {
    organization = "Toomean"

    workspaces {
      name = "hexlet-project-3"
    }
  }
}

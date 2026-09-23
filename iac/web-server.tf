resource "docker_network" "frontend_backend" {
  name = "frontend-backend-${terraform.workspace}"
}

resource "docker_network" "backend_database" {
  name = "backend-database-${terraform.workspace}"
}

resource "docker_image" "frontend" {
  name = "nginx:latest"
}

resource "docker_image" "backend" {
  name = "node:latest"
}

resource "docker_image" "database" {
  name = "postgres:latest"
}

resource "docker_container" "frontend" {
  name  = "web-${terraform.workspace}"
  image = docker_image.frontend.image_id

  ports {
    internal = 80
    external = var.frontend_port[terraform.workspace]
  }

  networks_advanced {
    name = docker_network.frontend_backend.name
  }
}

resource "docker_container" "backend" {
  name    = "api-${terraform.workspace}"
  image   = docker_image.backend.image_id
  command = ["tail", "-f", "/dev/null"]

  ports {
    internal = 3000
    external = var.backend_port[terraform.workspace]
  }

  networks_advanced {
    name = docker_network.frontend_backend.name
  }

  networks_advanced {
    name = docker_network.backend_database.name
  }
}

resource "docker_container" "database" {
  name  = "database-${terraform.workspace}"
  image = docker_image.database.image_id

  ports {
    internal = 5432
    external = var.database_port[terraform.workspace]
  }

  networks_advanced {
    name = docker_network.backend_database.name
  }

  env = [
    "POSTGRES_PASSWORD=postgres"
  ]
}
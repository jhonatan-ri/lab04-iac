variable "frontend_port" {
  description = "Puerto externo del frontend"
  type        = map(number)
}

variable "backend_port" {
  description = "Puerto externo del backend"
  type        = map(number)
}

variable "database_port" {
  description = "Puerto externo de PostgreSQL"
  type        = map(number)
}
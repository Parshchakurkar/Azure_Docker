variable "client_id" {}

variable "client_secret" {}

variable "ssh_public_key" {}


variable "env" {
  default = "dev"
}

variable "location" {
  default = "West Europe"
}

variable "resource_group" {
  default = "dockerrg"
}

variable "cluster" {
  default = "dockercluster"
}
variable "node_count" {
  default = 2
}
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.89.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {

  }
}

resource "azurerm_resource_group" "dockerresource" {
  name     = "docker_resource"
  location = "West Europe"

}

resource "azurerm_kubernetes_cluster" "dockercluster" {
  name                = "docker_cluster"
  location            = azurerm_resource_group.dockerresource.location
  resource_group_name = azurerm_resource_group.dockerresource.name
  dns_prefix          = "cluster1"

  default_node_pool {
    name       = "default"
    node_count = 3
    vm_size    = "Standard_D2_v2"
  }

}
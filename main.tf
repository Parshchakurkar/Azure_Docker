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
  name                = "${var.cluster}_${var.resource_group}_${var.env}"
  location            = azurerm_resource_group.dockerresource.location
  resource_group_name = azurerm_resource_group.dockerresource.name
  dns_prefix          = "cluster1"

  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  default_node_pool {
    name       = "default"
    node_count = 3
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku = "Standard"
    network_plugin    = "kubenet"
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }


}

terraform {
  backend "azurerm"{
    
  }
}
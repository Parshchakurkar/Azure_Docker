output "client_certificate" {
  value = azurerm_kubernetes_cluster.dockercluster.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.dockercluster.kube_config_raw

  sensitive = true
}

output "cluster_username" {
  value = azurerm_kubernetes_cluster.dockercluster.kube_config.0.username

}

output "host" {
  value = azurerm_kubernetes_cluster.dockercluster.kube_config.0.host
}
output "cluster_password" {
  value = azurerm_kubernetes_cluster.dockercluster.kube_config.0.password
}

output "client_key" {
  value = azurerm_kubernetes_cluster.dockercluster.kube_config.0.client_key
}
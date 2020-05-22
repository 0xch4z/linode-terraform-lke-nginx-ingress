output "api_server" {
  value = linode_lke_cluster.cluster.api_endpoints[0]
}

output "api_server_token" {
  value = local.kubeconfig.users[0].user.token
}

output "ca_certificate" {
  value = base64decode(
    local.kubeconfig.clusters[0].cluster["certificate-authority-data"]
  )
}

output "gateway" {
  description = "Gateway to the nginx-ingress exposing the services on the cluster."
  value       = local.lb_ingress.ip
}

output "host" {
    value = local.lb_ingress.hostname
}

output "echo-service-endpoint" {
    value = "http://${local.lb_ingress.ip}${local.echo_service_base_path}"
}

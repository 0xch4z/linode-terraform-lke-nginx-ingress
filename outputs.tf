output "gateway" {
    description = "Gateway to the nginx-ingress exposing the services on the cluster."
    value       = data.kubernetes_service.nginx-ingress-controller.load_balancer_ingress[0].ip
}

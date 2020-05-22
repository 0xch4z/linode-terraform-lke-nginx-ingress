resource "helm_release" "nginx-ingress-release" {
  name       = "nginx-ingress"
  repository = "https://kubernetes-charts.storage.googleapis.com"
  chart      = "nginx-ingress"

  set {
    name  = "controller.publishService.enabled"
    value = "true"
  }
}

data "kubernetes_service" "nginx-ingress-controller" {
  metadata {
    name = "nginx-ingress-controller"
  }

  depends_on = [helm_release.nginx-ingress-release]
}

locals {
  lb_ingress = data.kubernetes_service.nginx-ingress-controller.load_balancer_ingress[0]
}

locals {
  echo_labels = {
    app = "echo-demo"
  }

  echo_server_port = 5678
}

resource "kubernetes_service" "echo" {
  metadata {
    name   = "echo"
    labels = local.echo_labels
  }

  spec {
    selector = local.echo_labels

    port {
      port        = local.echo_server_port
      target_port = local.echo_server_port
      protocol    = "TCP"
      name        = "http"
    }
  }
}

resource "kubernetes_deployment" "echo" {
  metadata {
    name = "echo"
  }

  spec {
    replicas = 3

    selector {
      match_labels = local.echo_labels
    }

    template {
      metadata {
        labels = local.echo_labels
      }

      spec {
        container {
          image = "hashicorp/http-echo"
          name  = "echo"
          args  = ["-text", "'Hi from lke (:'"]

          port {
            container_port = 5678
          }
        }
      }
    }
  }
}

resource "kubernetes_ingress" "echo" {
  metadata {
    name = "echo-ingress"
    annotations = {
      "kubernetes.io/ingress.class"                = "nginx"
      "nginx.ingress.kubernetes.io/rewrite-target" = "/$2"
    }
  }

  spec {
    rule {
      http {
        path {
          path = "/echo(/|$)(.*)"

          backend {
            service_name = kubernetes_service.echo.metadata[0].name
            service_port = local.echo_server_port
          }
        }
      }
    }
  }

  depends_on = [helm_release.nginx-ingress-release]
}

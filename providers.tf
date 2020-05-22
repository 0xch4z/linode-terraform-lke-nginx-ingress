provider "linode" {
  api_version = "v4beta"
}

provider "kubernetes" {
  load_config_file = false

  host  = module.cluster.api_server
  token = module.cluster.api_server_token

  cluster_ca_certificate = module.cluster.ca_certificate
}

provider "helm" {
  kubernetes {
    load_config_file = false

    host  = module.cluster.api_server
    token = module.cluster.api_server_token

    cluster_ca_certificate = module.cluster.ca_certificate
  }
}

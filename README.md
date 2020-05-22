# linode-terraform-lke-nginx-ingress

Provisions a simple nginx ingress on an LKE cluster exposing an echo server, in pure Terraform (no Terraform manifests in YAML).

Leverages `terraform-provider-linode`, `terraform-provider-kubernetes`, and `terraform-provider-helm`.

When the provisioning succeeds, a gateway IP and Host point to the nginx-ingress-controller will be output. Hitting the `/echo` endpoint on these will route you to the HTTP echo server.

## Usage

```
LINODE_API_TOKEN=XXXXXXXXXXXXX terraform apply
```

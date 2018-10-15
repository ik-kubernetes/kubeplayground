resource "local_file" "k8s_config" {
  content  = "${local.kubeconfig}"
  filename = "${path.cwd}/k8s_configs/config-demo"
}

resource "local_file" "k8s_auth" {
  content  = "${local.config_map_aws_auth}"
  filename = "${path.cwd}/k8s_configs/config-map-aws-auth.yaml"
}

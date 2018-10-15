variable "cluster_name" {
  type = "string"
}

variable "vpc_cidr_block" {
  type = "string"
}

variable "region" {
  type = "string"
}

variable "cidr_blocks" {
  type = "map"
}

variable "admin_whitelist" {
  type = "list"
}
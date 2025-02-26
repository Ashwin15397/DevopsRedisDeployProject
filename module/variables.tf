variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "prefix" {
  description = "Prefix for constructing object names"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version for the EKS cluster"
}

variable "vpc_cidr" {
  description = "CIDR block for EKS VPC"
  type        = string
}

variable "node_group_instance_types" {
  description = "Instance types to use for EKS nodes"
  type        = list(string)
}

variable "node_group_desired_size" {
  description = "Desired cluster size"
  type        = number
}

variable "node_group_min_size" {
  description = "Minimum cluster size"
  type        = number
}

variable "node_group_max_size" {
  description = "Maximum cluster size"
  type        = number
}

variable "azs_subnets" {
  type = map(object({
    az      = string
    private = string
    public  = string
  }))
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
}
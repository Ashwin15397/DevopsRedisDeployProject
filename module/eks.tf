locals {
  cluster_name = "devops-cluster"
  vpc_name     = "devops-vpc"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "= 20.33.1"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  cluster_name    = local.cluster_name
  cluster_version = var.kubernetes_version

  # Change to "false" and add "cluster_endpoint_public_access_cidrs" for increased security:
  cluster_endpoint_public_access = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
    aws-ebs-csi-driver = {
      most_recent = true
    }
  }

  # Change to "false" for increased security:
  enable_cluster_creator_admin_permissions = true

  create_node_security_group = false

  eks_managed_node_groups = {
    node_group_1 = {
      min_size       = var.node_group_min_size
      max_size       = var.node_group_max_size
      desired_size   = var.node_group_desired_size
      instance_types = var.node_group_instance_types
      iam_role_additional_policies = {
        AmazonEBSCSIDriverPolicy     = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
        AmazonEKS_CNI_Policy         = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
        AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
      }
    }
  }

  tags                          = var.tags
  cluster_enabled_log_types     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  create_kms_key                = true
  kms_key_enable_default_policy = true
  enable_kms_key_rotation       = true
}
aws_region                = "eu-central-1"
prefix                    = "devops"
kubernetes_version        = "1.32"
vpc_cidr                  = "10.0.0.0/16"
node_group_instance_types = ["t3.medium"]
node_group_min_size       = 3
node_group_max_size       = 15
node_group_desired_size   = 3
azs_subnets = {
  subnet1 = { az = "eu-central-1a", private = "10.0.1.0/24", public = "10.0.101.0/24" }
  subnet2 = { az = "eu-central-1b", private = "10.0.2.0/24", public = "10.0.102.0/24" }
  subnet3 = { az = "eu-central-1c", private = "10.0.3.0/24", public = "10.0.103.0/24" }
}
tags = {
  Environment = "production"
  Project     = "eks-redis"
}


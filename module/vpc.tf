module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.19.0"

  name                   = "devops-vpc"
  cidr                   = var.vpc_cidr
  azs                    = [for x in values(var.azs_subnets) : x.az]
  private_subnets        = [for x in values(var.azs_subnets) : x.private]
  public_subnets         = [for x in values(var.azs_subnets) : x.public]
  enable_nat_gateway     = true
  single_nat_gateway     = false
  one_nat_gateway_per_az = true
  enable_dns_hostnames   = true
  enable_dns_support     = true
  tags                   = merge(var.tags, { Name = "${local.vpc_name}" })
}

resource "aws_security_group" "eks_sg" {
  vpc_id = module.vpc.vpc_id

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  tags = var.tags
}

terraform {
  required_version = ">= 1.5.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.86.1"
    }
  }
  backend "s3" {
    bucket = "devops-tf-state-bucket"
    key    = "eu-central-1/terraform-devops.tfstate"
    region = "eu-central-1"
    acl    = "bucket-owner-full-control"
  }
}
    

provider "aws" {
  region = var.aws_region
}
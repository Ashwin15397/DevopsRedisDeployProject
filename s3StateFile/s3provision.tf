
# Create an S3 bucket for Terraform state
resource "aws_s3_bucket" "tf_state" {
  bucket = "devops-tf-state-bucket"  # Change to a unique bucket name
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "Terraform State Bucket"
  }
}




# Create a DynamoDB table for state locking
resource "aws_dynamodb_table" "tf_lock" {
  name         = "terraform-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "Terraform Lock Table"
  }
}




# Output the bucket name and DynamoDB table name
output "s3_bucket_name" {
  value = aws_s3_bucket.tf_state.bucket
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.tf_lock.name
}



terraform {
  required_version = ">= 1.5.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.86.1"
    }
  }
}
provider "aws" {
  region = "eu-central-1"
}
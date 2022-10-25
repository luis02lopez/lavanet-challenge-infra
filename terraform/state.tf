# Configure the AWS Provider
provider "aws" {
  region = var.aws_region

  # Default tags are applied to all resources created in this module
  default_tags {
    tags = {
      Terraform    = "true"
    }
  }
}

terraform {
  backend "s3" {
    bucket  = "lavanet-terraform-state"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "ministackadmin"
  secret_key                  = "ministacksecret"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  
  s3_use_path_style           = true
  
  endpoints {
    ec2      = "http://localhost:4566"
    s3       = "http://localhost:4566"
    route53  = "http://localhost:4566"
    acm      = "http://localhost:4566"
  }
}
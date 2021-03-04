terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.30.0"
    }
  }
}

provider "aws" {

  # Configuration options
  region                  = "ap-south-1"
  shared_credentials_file = "/Users/debasis panda/.aws/credentials"
  profile                 = "default"
}

# You can provide different options for authentication
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication

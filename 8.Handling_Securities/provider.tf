terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.30.0"
    }
  }
}

##############
## Default Provider
##############
provider "aws" {

  # Configuration options
  region                  = "ap-south-1"
  shared_credentials_file = "/Users/debasis panda/.aws/credentials"
  profile                 = "default"
}

####################
## Another Provider with diff alias
####################

provider "aws" {

  alias  = "aws02" ##### Another Alias
  region = "us-east-1"
  # profile    =  "account02"

}

# You can provide different options for authentication
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.30.0"
    }
  }
  backend "remote" {}
}

provider "aws" {

  # Configuration options
  region                  = "ap-south-1"
  shared_credentials_file = "/Users/debasis panda/.aws/credentials"
  profile                 = "default"
}

resource "aws_iam_user" "lb" {
  name = "remoteuser"
  path = "/system/"

}

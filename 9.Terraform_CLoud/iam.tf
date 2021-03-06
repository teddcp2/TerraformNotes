terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.30.0"
    }
  }
  backend "remote" {}
}

provider "aws" {}

resource "aws_iam_user" "lb" {
  name = "remoteuser"
  path = "/system/"

}

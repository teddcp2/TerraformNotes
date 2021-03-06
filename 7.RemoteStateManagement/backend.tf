terraform {

  backend "s3" {

    bucket = "teddy-terraform-s3-bucket"
    key    = "remotedemo.tfstate"

    region = "ap-south-1"

    shared_credentials_file = "/Users/debasis panda/.aws/credentials"
    profile                 = "default"

    dynamodb_table = "s3-state-lock"
  }
}

module "demo_s3_bucket_terraform" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "tedd-prod-bucket-for-terraform-learning"
  acl    = "private"

  versioning = {
    enabled = true
  }

}

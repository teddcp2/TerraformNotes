
module "ec2-module" {
  source        = "./modules/ec2/"
  instance_type = "t2.micro"
}

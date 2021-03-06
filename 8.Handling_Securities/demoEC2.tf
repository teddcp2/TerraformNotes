


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "ubuntu2" {
  provider    = aws.aws02
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

#########################################
# Create using default provider
resource "aws_instance" "myEC2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "demoEC2"
  }
}

#############################################
# Create using another aws provider
# But in Another Region/Account
resource "aws_instance" "my2ndEC2" {

  provider      = aws.aws02
  ami           = data.aws_ami.ubuntu2.id
  instance_type = "t2.micro"

  tags = {
    Name = "demoEC2"
  }
}

##########################################
# Handling Sensitive data
# with sensitive param
locals {
  db_password = {
    admin = "password"
  }
}

output "db_password" {
  value     = local.db_password
  sensitive = true
}

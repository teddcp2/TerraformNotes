
locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())

  common_tags = {
    Owner   = "DevOps Team"
    service = "backend"
  }
}

# EC2
data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "instance-1" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t2.micro"
  tags          = local.common_tags
  count         = var.istest == true ? 2 : 0
}

# resource "aws_key_pair" "loginkey" {
#   key_name   = "login-key"
#   public_key = file("${path.module}/id_rsa.pub")
# }

resource "aws_security_group" "dynamicsg" {
  name        = "dynamic-sg"
  description = "Ingress for Vault"

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.sg_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}


# IAM USER
resource "aws_iam_user" "terraform-user" {
  name  = element(var.iam-user-name, count.index)
  count = 3
  path  = "/system/"
}

output "arns" {
  value = aws_iam_user.terraform-user[*].arn
}

output "names" {
  value = aws_iam_user.terraform-user[*].name
}

output "userMapper" {
  value = zipmap(aws_iam_user.terraform-user[*].name, aws_iam_user.terraform-user[*].arn)
}

resource "aws_instance" "myEC2" {
  ami           = lookup(var.ami, var.region, "us-east-1")
  instance_type = var.instanceType

  tags = {
    Name = "demoEC2"
  }
}

output "myEC2_ID" {
  value = aws_instance.myEC2.id
}

output "myEC2_IP" {
  value = aws_instance.myEC2.public_ip
}

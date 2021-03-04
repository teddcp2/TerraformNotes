resource "aws_instance" "myec2" {
  ami           = "ami-0eeb03e72075b9bcc"
  instance_type = "t2.micro"
  key_name      = "my-ec2"

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx"
    ]

    on_failure = fail # Continue

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("${path.module}/my-ec2.pem")
      host        = self.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum -y install nano"
    ]
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo yum -y remove nano"
    ]
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.myec2.private_ip} >> private_ips.txt"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("${path.module}/my-ec2.pem")
    host        = self.public_ip
  }
}



# on-failure - fail or continue
# when - destory , default is create

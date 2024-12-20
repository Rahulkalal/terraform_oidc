resource "aws_instance" "web" {
  count         = 2
  ami           = "ami-0e2c8caa4b6378d8c" # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public[count.index].id
  security_groups = [aws_security_group.web_sg.name]

  user_data = <<-EOF
              #!/bin/bash
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
            EOF

  tags = {
    Name = "WebServer-${count.index}"
  }
}


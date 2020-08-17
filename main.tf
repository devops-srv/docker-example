provider "aws" {
    region = "us-west-1"
    access_key = ""
    secret_key = ""
}
resource "aws_instance" "example" {
  ami           = "ami-0dd005d3eb03f66e8"
  instance_type = "t2.micro"
  key_name      = "devops-training"
  vpc_security_group_ids = ["sg-0b7e9dfb514f5b22c"]
  user_data = <<-EOF
              #!/bin/bash
              echo "welcome to DevOps session!!!" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
  tags = {
    Name = "web Server"
  }
}
resource "aws_security_group" "instance" {
  name = "demo-web-sg"
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
output "public_ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP of the web server"
}

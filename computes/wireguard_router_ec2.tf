resource "aws_instance" "wireguard_router" {
  ami           = "ami-0818ff4e4d072e0ec"
  instance_type = "t3.small"
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = var.wireguard_router_ec2_name
  }

  security_groups = [aws_security_group.wireguard_router_sg.name]

  key_name = "your-key-name"

  user_data = <<-EOF
              #!/bin/bash
              apt update && apt install -y wireguard
              EOF
}
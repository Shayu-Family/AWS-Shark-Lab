resource "aws_instance" "tooling_vm" {
  ami           = "ami-0818ff4e4d072e0ec"
  instance_type = "t3.small"
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = var.tooling_vm_ec2_name
  }

  security_groups = [aws_security_group.tooling_vm_sg.name]

  key_name = "TODO"
}
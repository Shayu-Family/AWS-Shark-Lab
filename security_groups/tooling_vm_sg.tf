resource "aws_security_group" "tooling_vm_sg" {
  name        = var.tooling_vm_sg_name
  description = "Allow SSH only with session keys for Tooling VM EC2"
}

resource "aws_vpc_security_group_egress_rule" "allow_tooling_vm_all_traffic_ipv4" {
  security_group_id = aws_security_group.tooling_vm_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_tooling_vm_all_traffic_ipv6" {
  security_group_id = aws_security_group.tooling_vm_sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"
}
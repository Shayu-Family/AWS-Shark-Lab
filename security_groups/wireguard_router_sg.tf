resource "aws_security_group" "wireguard_router_sg" {
  name  = var.wireguard_router_sg_name
  description = "Allow DNS, WireGuard, and SSH traffic for WireGuard Router EC2"
  vpc_id = aws_vpc.main_vpc
}

resource "aws_vpc_security_group_ingress_rule" "allow_wireguard_router_ssh" {
  security_group_id = aws_security_group.wireguard_router_sg.id

  cidr_ipv4   = "172.16.0.0/16"
  from_port   = 20222
  ip_protocol = "tcp"
  to_port     = 20222
}


resource "aws_vpc_security_group_ingress_rule" "allow_wireguard_router_tcp_dns" {
  security_group_id = aws_security_group.wireguard_router_sg.id

  cidr_ipv4   = "10.0.0.0/16"
  from_port   = 53
  ip_protocol = "tcp"
  to_port     = 53
}

resource "aws_vpc_security_group_ingress_rule" "allow_wireguard_router_udp_dns" {
  security_group_id = aws_security_group.wireguard_router_sg.id

  cidr_ipv4   = "10.0.0.0/16"
  from_port   = 53
  ip_protocol = "udp"
  to_port     = 53
}

resource "aws_vpc_security_group_ingress_rule" "allow_wireguard_router_wg_access_udp" {
  security_group_id = aws_security_group.wireguard_router_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 51820
  ip_protocol = "udp"
  to_port     = 51820
}

resource "aws_vpc_security_group_ingress_rule" "allow_wireguard_router_wg_access_tcp" {
  security_group_id = aws_security_group.wireguard_router_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 51820
  ip_protocol = "tcp"
  to_port     = 51820
}

resource "aws_vpc_security_group_egress_rule" "allow_wireguard_router_all_traffic_ipv4" {
  security_group_id = aws_security_group.wireguard_router_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_wireguard_router_all_traffic_ipv6" {
  security_group_id = aws_security_group.wireguard_router_sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"
}
resource "aws_security_group" "packer" {
  name        = "${var.vpc_name}_packer_builds"
  description = "Default security group for packer builds"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}_packer_builds"
  }
}

resource "aws_vpc_security_group_ingress_rule" "packer_build_ingress" {
  security_group_id = aws_security_group.packer.id
  #"${chomp(data.http.myip.response_body)}/32"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "packer_build_egress" {
  security_group_id = aws_security_group.packer.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
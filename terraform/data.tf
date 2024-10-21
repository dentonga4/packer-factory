data "aws_region" "current" {}

data "aws_availability_zones" "available" {
  state = "available"
}

data "http" "myip" {
  url = "https://ipv4.icanhazip.com"
}
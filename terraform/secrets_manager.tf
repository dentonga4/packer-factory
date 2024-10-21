resource "aws_secretsmanager_secret" "packer_vpc_id" {
  name = "pkr_vpc_id"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret" "packer_subnet_id" {
  name = "pkr_subnet_id"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret" "packer_sg_id" {
  name = "pkr_sg_id"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret" "packer_instance_profile" {
  name = "pkr_instance_profile"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "packer_vpc_id" {
  secret_id     = aws_secretsmanager_secret.packer_vpc_id.id
  secret_string = aws_vpc.main.id
}

resource "aws_secretsmanager_secret_version" "packer_subnet_id" {
  secret_id     = aws_secretsmanager_secret.packer_subnet_id.id
  secret_string = aws_subnet.public.id
}

resource "aws_secretsmanager_secret_version" "packer_sg_id" {
  secret_id     = aws_secretsmanager_secret.packer_sg_id.id
  secret_string = aws_security_group.packer.id
}

resource "aws_secretsmanager_secret_version" "packer_instance_profile" {
  secret_id     = aws_secretsmanager_secret.packer_instance_profile.id
  secret_string = aws_iam_instance_profile.packer_build.name
}
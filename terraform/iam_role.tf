resource "aws_iam_role" "packer_build" {
  name = "packer_build_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = "packer_build_role"
  }
}

resource "aws_iam_role_policy_attachment" "packer_build" {
  role       = aws_iam_role.packer_build.name
  policy_arn = aws_iam_policy.packer_build.arn
}

resource "aws_iam_instance_profile" "packer_build" {
  name = "packer_build_instance_profile"
  role = aws_iam_role.packer_build.name
}
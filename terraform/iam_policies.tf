resource "aws_iam_policy" "packer_build" {
  name        = "packer_build_policy"
  path        = "/"
  description = "A default policy for the Packer builders"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ssmmessages:CreateControlChannel",
          "ssmmessages:CreateDataChannel",
          "ssmmessages:OpenControlChannel",
          "ssmmessages:OpenDataChannel",
          "ssm:UpdateInstanceInformation"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "ssmmessages:CreateControlChannel",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
     {
        Action = [
            "s3:PutObject",
            "s3:GetEncryptionConfiguration",
            "kms:Decrypt",
            "kms:GenerateDataKey"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      
    ]
  })
}
data "aws_caller_identity" "current" {}

resource "aws_iam_policy" "ssm_access_policy" {
  name = "${var.iam_role_name}_ssm_policy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ssm:GetParameter",
          "ssm:GetParameters"
        ],
        Resource = "arn:aws:ssm:${var.region}:${data.aws_caller_identity.current.account_id}:parameter${var.ssm_parameter_name}"
      },
      {
        Effect = "Allow",
        Action = "kms:Decrypt",
        Resource = "*" # Consider restricting this to a specific key in production
      }
    ]
  })
}

resource "aws_iam_role" "ec2_ssm_role" {
  name = var.iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_ssm" {
  role       = aws_iam_role.ec2_ssm_role.name
  policy_arn = aws_iam_policy.ssm_access_policy.arn
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = var.iam_instance_profile_name
  role = aws_iam_role.ec2_ssm_role.name
}

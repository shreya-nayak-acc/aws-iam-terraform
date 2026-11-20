resource "aws_iam_user" "s3_user" {

  name = "terraform-s3-user-shreya"

  tags = {
    Project = "IAMAutomation"
  }
}

resource "aws_iam_policy" "s3_read_policy" {

  name = var.policy_name

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]

        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "attach_policy" {

  user       = aws_iam_user.s3_user.name

  policy_arn = aws_iam_policy.s3_read_policy.arn
}

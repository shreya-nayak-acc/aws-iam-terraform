output "iam_user" {
  value = aws_iam_user.s3_user.name
}

output "policy_name" {
  value = aws_iam_policy.s3_read_policy.name
}

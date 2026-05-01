output "lambda_role_arn" {
  value       = aws_iam_role.lambda_execution.arn
  description = "ARN of the Lambda execution role"
}

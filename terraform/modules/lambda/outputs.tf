output "lambda_arn" {
  value       = aws_lambda_function.notifier.arn
  description = "ARN of the Lambda function"
}

output "function_name" {
  value       = aws_lambda_function.notifier.function_name
  description = "Name of the Lambda function"
}

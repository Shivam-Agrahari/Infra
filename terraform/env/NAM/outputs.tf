output "sns_topic_arn" {
  value       = module.sns.topic_arn
  description = "SNS topic ARN"
}

output "lambda_function_name" {
  value       = module.lambda.function_name
  description = "Lambda function name"
}

output "eventbridge_rule_name" {
  value       = module.eventbridge.rule_name
  description = "EventBridge rule name"
}

output "github_role_arn" {
  value       = module.iam.role_arn
  description = "IAM role ARN for GitHub OIDC"
}

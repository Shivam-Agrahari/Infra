variable "sns_topic_arn" {
  description = "ARN of the SNS topic to trigger the Lambda"
  type        = string
}

variable "lambda_role_arn" {
  description = "IAM role ARN for Lambda execution"
  type        = string
}

variable "eventbridge_rule_arn" {
  description = "ARN of the EventBridge rule to trigger the Lambda"
  type        = string
}

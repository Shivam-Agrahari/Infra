variable "sns_topic_arn" {
  type        = string
  description = "SNS topic ARN for notifications"
}

variable "lambda_role_arn" {
  type        = string
  description = "IAM role ARN for Lambda execution"
}

variable "eventbridge_rule_arn" {
  type        = string
  description = "ARN of EventBridge rule that triggers Lambda"
}

variable "sns_topic_arn" {
  type        = string
  description = "SNS topic ARN for notifications"
}

variable "environment" {
  type        = string
  description = "Deployment environment (e.g., prod, dev)"
}

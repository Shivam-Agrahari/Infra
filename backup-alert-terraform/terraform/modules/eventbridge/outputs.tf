output "rule_name" {
  value       = aws_cloudwatch_event_rule.backup_failed.name
  description = "Name of the EventBridge rule"
}

output "rule_arn" {
  value       = aws_cloudwatch_event_rule.backup_failed.arn
  description = "ARN of the EventBridge rule"
}

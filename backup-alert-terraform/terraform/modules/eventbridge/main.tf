resource "aws_cloudwatch_event_rule" "backup_failed" {
  name        = "backup-failed-rule"
  description = "Triggers on AWS Backup job failures"
  event_pattern = <<EOF
{
  "source": ["aws.backup"],
  "detail-type": ["Backup Job State Change"],
  "detail": {
    "state": ["FAILED"]
  }
}
EOF
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.backup_failed.name
  target_id = "lambda-notifier"
  arn       = var.lambda_arn
}

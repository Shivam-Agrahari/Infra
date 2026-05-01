resource "aws_lambda_function" "notifier" {
  function_name = "backup-failure-notifier"
  role          = var.lambda_role_arn
  handler       = "index.handler"
  runtime       = "python3.9"

  filename      = "${path.module}/lambda.zip"

  environment {
    variables = {
      SNS_TOPIC_ARN = var.sns_topic_arn
    }
  }
}

resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.notifier.function_name
  principal     = "events.amazonaws.com"
  source_arn    = var.eventbridge_rule_arn
}

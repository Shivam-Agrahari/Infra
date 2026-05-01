data "archive_file" "lambda_zip" {
  type        = "zip"
  # From terraform/env/prod, go up two levels to Infra/lambda
  source_dir  = "${path.root}/../../../lambda"
  output_path = "${path.module}/lambda.zip"
}

resource "aws_lambda_function" "notifier" {
  function_name    = "notifier"
  role             = var.lambda_role_arn
  handler          = "index.handler"
  runtime          = "python3.9"

  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
}

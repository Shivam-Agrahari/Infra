data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "${path.root}/lambda"         # path to your source code folder
  output_path = "${path.module}/lambda.zip"   # where Terraform will write the zip
}

resource "aws_lambda_function" "notifier" {
  function_name = "notifier"
  role          = var.lambda_role_arn
  handler       = "index.handler"             # index.py with handler() function
  runtime       = "python3.9"

  filename      = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
}

resource "aws_iam_role" "github_actions_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Federated = var.oidc_provider_arn
      },
      Action = "sts:AssumeRoleWithWebIdentity",
      Condition = {
        StringEquals = {
          "token.actions.githubusercontent.com:sub" = var.github_subject
        }
      }
    }]
  })
}

resource "aws_iam_role_policy" "scoped_policy" {
  name = "${var.role_name}-policy"
  role = aws_iam_role.github_actions_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "sns:*",
          "lambda:*",
          "events:*",
          "backup:List*",
          "backup:Get*"
        ],
        Resource = "*"
      }
    ]
  })
}

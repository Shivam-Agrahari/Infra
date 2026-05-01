provider "aws" {
  region = var.region
}

module "sns" {
  source      = "../../modules/sns"
  alert_email = var.alert_email
}

module "eventbridge" {
  source     = "../../modules/eventbridge"
  lambda_arn = module.lambda.lambda_arn
}

module "iam" {
  source            = "../../modules/iam"
  role_name         = "github-actions-terraform-role"
  oidc_provider_arn = "arn:aws:iam::237921648803:oidc-provider/token.actions.githubusercontent.com"
  github_subject    = "repo:Shivam-Agrahari/Infra:ref:refs/heads/main"
}

module "lambda_iam" {
  source        = "../../modules/lambda_iam"
  environment   = var.environment
  sns_topic_arn = module.sns.topic_arn
}

module "lambda" {
  source               = "../../modules/lambda"
  sns_topic_arn        = module.sns.topic_arn
  lambda_role_arn      = module.lambda_iam.lambda_role_arn   # <-- updated here
  eventbridge_rule_arn = module.eventbridge.rule_arn
}

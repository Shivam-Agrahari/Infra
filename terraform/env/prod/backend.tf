terraform {
  backend "s3" {
    bucket         = "my-terraform-backend-backups"
    key            = "prod/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

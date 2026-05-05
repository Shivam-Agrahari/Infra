terraform {
  backend "s3" {
    bucket         = "my-terraform-backend-backups"
    key            = "<>/terraform.tfstate"
    region         = "<>"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

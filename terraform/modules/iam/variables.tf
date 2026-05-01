variable "role_name" {
  description = "The name of the IAM role to be used by GitHub Actions via OIDC"
  type        = string
  default     = "github-actions-terraform-role"
}

variable "oidc_provider_arn" {
  description = "ARN of the OIDC provider for GitHub Actions"
  type        = string
}

variable "github_subject" {
  description = "GitHub OIDC subject string (repo and branch)"
  type        = string
  # Example: "repo:Shivam-Agrahari/Infra:ref:refs/heads/main"
}

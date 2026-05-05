variable "region" {
  type        = string
  description = "AWS region"
}

variable "alert_email" {
  type        = string
  description = "Email for SNS subscription"
}

variable "environment" {
  type        = string
  default     = "prod"
}

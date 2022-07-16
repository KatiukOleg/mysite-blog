variable "AWS_REGION" {
  description = "Default AWS region for provisioning resources"
  default = "eu-north-1"
}

variable "Environment" {
  description = "AWS Environment"
  default = "DEV"
}

variable "Project" {
  description = "Project name"
  default = "mysite-blog"
}

variable "SecretKey" {
  description = "Unique Secret Key"
  default = ""
}
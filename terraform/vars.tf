variable "AWS_REGION" {
  description = "Default AWS region for provisioning resources"
  default = ""
}

variable "Environment" {
  description = "AWS Environment"
  default = ""
}

variable "Project" {
  description = "Project name"
  default = ""
}

variable "BucketUniqueSuffix" {
  description = "Unique Suffix for Bucket"
  default = ""
}

variable "SecretKey" {
  description = "Unique Secret Key"
  default = ""
}
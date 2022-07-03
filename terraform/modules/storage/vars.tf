variable "Region" {
  description = "AWS region"
  default = "eu-north-1"
}

variable "Environment" {
  description = "Deployment Environment"
  default = "DEV"
}

variable "Project" {
  description = "Project Name"
  default = "mysite-blog"
}

variable "BucketUniqueSuffix" {
  description = "Unique Suffix for Bucket"
  default = "static-1kom4kd"
}


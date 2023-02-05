terraform {
  cloud {
    organization = "KatiukOlegOrg"
    workspaces {
      tags = ["mysite-blog"]
    }
  }
  
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.8.0"
    }
  }

  required_version = ">= 1.1.7"
}

provider "aws" {
  #profile = var.AWS_PROFILE
  region = var.AWS_REGION
}
terraform {
  required_providers {
    aws = {         #telling terraform to work with aws
      source = "hashicorp/aws"
      version = "6.11.0"  #AWS provider version, not terraform version 
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
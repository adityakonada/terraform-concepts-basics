terraform {
  required_providers {
    aws = {         #telling terraform to work with aws
      source = "hashicorp/aws"
      version = "6.11.0"  #AWS provider version, not terraform version 
    }
  }

  #we are configuring the desired terraform folder to S3 bucket to store terraform.tfstate file
    backend "s3" {
    bucket = "Your-Bucket-Name"
    key    = "anyname" #file name in S3 bucket for this terraform folder
    region = "us-east-1"
    dynamodb_table = "dynamoDB-table-name" # execution safety lock == dynambodb table configuration
  }
}

provider "aws" {
  region = "us-east-1"
}
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.16.0"
    }
  }

  backend "s3" {
    bucket = "morrisons-project"
    key    = "morrisons-project-vpc-remotestate"
    region = "us-east-1"
    dynamodb_table = "morrisons-project-locking"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}
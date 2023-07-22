terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.9.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

resource "aws_instance" "tf_ec2" {
  ami = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  tags = {
    "Name" = "terraform"
  }
  count = 3
}

resource "aws_s3_bucket" "example" {
  bucket = "terraform_test-${count.index}"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }

  count = 3
}


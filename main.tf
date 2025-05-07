provider "aws" {
  region = "us-east-1"  # change as needed
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "my-unique-bucket-name-12345"  # must be globally unique
  acl    = "private"

  tags = {
    Name        = "MyBucket"
    Environment = "Dev"
  }
}


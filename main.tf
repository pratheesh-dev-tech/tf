provider "aws" {
  region = "us-west-1"  // Set your AWS region
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "my-example-bucket"
  acl    = "private"  // Deprecation warning; handle this in the acl resource
}

resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.example_bucket.id
  acl    = "private"  // Specify the ACL here
}

resource "aws_s3_bucket_object" "example_object" {
  bucket = aws_s3_bucket.example_bucket.bucket
  key    = "example.txt"
  content = "This is an example object"
}

# Define the provider
provider "aws" {
  region = "us-east-1"  # Update this with your desired region
}

# Create the S3 bucket
resource "aws_s3_bucket" "example_bucket" {
  bucket = "rathidevisuresh"
  acl    = "private"  # It's best to remove this and manage ACL separately
}

# Create the S3 bucket ACL (to handle the access control)
resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.example_bucket.bucket
  acl    = "private"
}

# Upload an object to the S3 bucket
resource "aws_s3_object" "example_object" {
  bucket       = aws_s3_bucket.example_bucket.bucket
  key          = "example.txt"
  content      = "This is an example object."
  acl          = "private"  # Optional ACL if needed
}

# Optionally, you can also use variables if you want more flexibility:
variable "bucket_name" {
  type    = string
  default = "rathidevisuresh"
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = var.bucket_name
  acl    = "private"  # Optional, depending on how you want to handle ACLs
}

resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.example_bucket.bucket
  acl    = "private"
}

resource "aws_s3_object" "example_object" {
  bucket  = aws_s3_bucket.example_bucket.bucket
  key     = "example.txt"
  content = "This is an example object."
  acl     = "private"
}

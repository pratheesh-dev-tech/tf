provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "raaarraaathi"  # Your specified bucket name

  tags = {
    Name        = "gyfengucrnhuivgvgmivgmi"
    Environment = "Dev"
  }
}

# Define ACL separately using aws_s3_bucket_acl resource
resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.example_bucket.bucket
  acl    = "private"
}

resource "aws_s3_bucket_object" "example_object" {
  bucket = aws_s3_bucket.example_bucket.bucket
  key    = "example-object"
  source = "path/to/local/file"  # Replace with your local file path
  acl    = "private"
}

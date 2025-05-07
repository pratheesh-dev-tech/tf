resource "aws_s3_bucket" "example_bucket" {
  bucket = "rathidevisuresh"
  acl    = "private"
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

resource "aws_s3_bucket" "example_bucket" {
  bucket = "rathidevisuresh"  # Replace with your existing bucket name

  acl                         = "private"
  region                      = "us-west-2"
  tags = {
    "Environment" = "Dev"
    "Name"        = "rathidevisuresh"  # Match the existing bucket name
  }

  website {
    # Add your website configuration if applicable
  }

  versioning {
    enabled = false
  }

  lifecycle_rule {
    # Define lifecycle policies if needed
  }

  logging {
    # Define logging settings if needed
  }

  replication_configuration {
    # Add replication configuration if applicable
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.example_bucket.bucket
  acl    = "private"
}

resource "aws_s3_bucket_object" "example_object" {
  bucket                 = aws_s3_bucket.example_bucket.bucket
  key                    = "example-object"
  acl                    = "private"
  source                 = "path/to/local/file"  # Replace with actual file path
  content_type           = "text/plain"
  server_side_encryption = "AES256"
}

# If using the aws_s3_object resource instead of aws_s3_bucket_object (as per deprecation warning):
resource "aws_s3_object" "example_object_new" {
  bucket                 = aws_s3_bucket.example_bucket.bucket
  key                    = "example-object"
  acl                    = "private"
  source                 = "path/to/local/file"  # Replace with actual file path
  content_type           = "text/plain"
  server_side_encryption = "AES256"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "rathidevisuresh"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    enabled = true

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    expiration {
      days = 365
    }
  }

  logging {
    target_bucket = "your-log-bucket-name"
    target_prefix = "logs/"
  }

  replication_configuration {
    role = "arn:aws:iam::123456789012:role/s3-replication-role"  # Replace with actual IAM role ARN

    rules {
      id     = "replication-rule"
      status = "Enabled"

      filter {
        prefix = ""
      }

      destination {
        bucket        = "arn:aws:s3:::destination-bucket"  # Replace with your destination bucket
        storage_class = "STANDARD"
      }
    }
  }

  tags = {
    Name        = "MyExampleBucket"
    Environment = "Dev"
  }
}

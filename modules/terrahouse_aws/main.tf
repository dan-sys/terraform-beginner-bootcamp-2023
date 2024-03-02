
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.37.0"
    }
  }
}


resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name
  tags = {
    BucketTag       = var.bucket_tag
  }
}

resource "aws_s3_bucket_website_configuration" "static_web_host" {
  bucket = aws_s3_bucket.website_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
  
}
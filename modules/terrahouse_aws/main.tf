
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
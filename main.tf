
resource "random_string" "rnd_bucket_name" {
  length           = 16
  special          = false
  upper            = false
  override_special = ""
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = random_string.rnd_bucket_name.result

  tags = {
    BucketTag       = var.bucket_tag
  }
}


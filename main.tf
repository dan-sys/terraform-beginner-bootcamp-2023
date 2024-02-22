
terraform {
  cloud {
    organization = "dannybolu"

    workspaces {
      name = "terra-infrastructure"
    }
  }
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.0"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.37.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

provider "random" {
  # Configuration options
}

resource "random_string" "rnd_bucket_name" {
  length           = 16
  special          = false
  upper            = false
  override_special = ""
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = random_string.rnd_bucket_name.result

  tags = {
    Name        = "My test buckett"
  }
}

output "rand_bucket_name"{
    value = random_string.rnd_bucket_name.result
}

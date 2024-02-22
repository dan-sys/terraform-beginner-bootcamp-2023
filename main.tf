
terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.0"
    }
  }
}

provider "random" {
  # Configuration options
}

resource "random_string" "rnd_bucket_name" {
  length           = 16
  special          = false
  override_special = ""
}

output "rand_bucket_name"{
    value = random_string.rnd_bucket_name.result
}

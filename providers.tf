
terraform {
#  cloud {
#    organization = "dannybolu"
#    workspaces {
#      name = "terra-infrastructure"
#    }
#  }
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
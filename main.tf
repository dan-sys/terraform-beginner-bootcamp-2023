terraform {
  required_providers {
    terratowns ={
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
}


provider "terratowns" {
  endpoint = "http://localhost:4567"
  user_uuid = "e328f4ab-b99f-421c-84c9-4ccea042c7d1"
  token = "9b49b3fb-b8e9-483c-b703-97ba88eef8e0"
}
#module "terrahouse_aws" {
#  source = "./modules/terrahouse_aws"
#  bucket_name = var.bucket_name
#  bucket_tag = var.bucket_tag
#  index_html_filepath = var.index_html_filepath
#  error_html_filepath = var.error_html_filepath
#  assets_path = var.assets_path
#  content_version = var.content_version
#}
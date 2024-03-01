terraform {
  
}



module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  bucket_name = var.bucket_name
  bucket_tag = var.bucket_tag
}
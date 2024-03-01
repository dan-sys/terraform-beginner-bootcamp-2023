output "bucket_name"{
    description="Bucket name for the static website bucket"
    value = module.terrahouse_aws.bucket_name
}
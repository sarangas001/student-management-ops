output "vpc_id" {
  value = module.vpc.vpc_id
}

output "state_bucket" {
  value = module.s3_backend.bucket_name
}
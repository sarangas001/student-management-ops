output "vpc_id" {
  value = module.vpc.vpc_id
}

output "state_bucket" {
  value = module.s3_backend.bucket_name
}

output "route53_zone_id" {
  value = module.route53.zone_id
}

output "route53_name_servers" {
  value = module.route53.name_servers
}

output "acm_certificate_arn" {
  value = module.acm.certificate_arn
}
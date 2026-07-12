module "vpc" {
  source       = "../../modules/vpc"
  project_name = "student-mgmt"
  vpc_cidr     = "10.0.0.0/16"
}

module "s3_backend" {
  source       = "../../modules/s3-backend"
  bucket_name  = "student-mgmt-terraform-state-dev"
  project_name = "student-mgmt"
}

module "route53" {
  source       = "../../modules/route53"
  domain_name  = var.domain_name
  project_name = "student-mgmt"
}

module "acm" {
  source          = "../../modules/acm"
  domain_name     = var.domain_name
  route53_zone_id = module.route53.zone_id
  project_name    = "student-mgmt"
}
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
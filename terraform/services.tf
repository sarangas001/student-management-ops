# 1. S3 Bucket (Student static files)
resource "aws_s3_bucket" "student_avatar_bucket" {
  bucket = "student-management-system-assets-local"

  tags = {
    Name        = "Student Assets Bucket"
    Environment = "Local-Dev"
  }
}

# 2. Route 53 Hosted Zone 
# "sms-project.local" 
resource "aws_route53_zone" "primary" {
  name = "studentmanagement.local"
}

# 3. ACM (SSL Certificate) 
resource "aws_acm_certificate" "cert" {
  domain_name       = "studentmanagement.local"
  validation_method = "DNS"

  subject_alternative_names = [
    "*.studentmanagement.local"
  ]

  tags = {
    Environment = "Local-Dev"
  }
}
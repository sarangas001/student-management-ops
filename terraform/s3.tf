resource "aws_s3_bucket" "app_storage" {
  bucket        = "student-management-storage-bucket-123"
  force_destroy = true 

  tags = {
    Name = "student-mgmt-s3"
  }
}

# Bucket ownership controls
resource "aws_s3_bucket_ownership_controls" "s3_oc" {
  bucket = aws_s3_bucket.app_storage.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Public access block configuration
resource "aws_s3_bucket_public_access_block" "s3_public_block" {
  bucket = aws_s3_bucket.app_storage.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
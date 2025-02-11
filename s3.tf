# Generate a unique suffix for the bucket name
resource "random_id" "suffix" {
  byte_length = 4
}

# Create S3 Bucket with a unique name
resource "aws_s3_bucket" "cdacprojectg5" {
  bucket = "cdacprojectg5-${random_id.suffix.hex}"
}

# Set ownership controls
resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.cdacprojectg5.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Public Access Block (set to allow public access)
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.cdacprojectg5.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Set ACL for public-read
resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]
  bucket = aws_s3_bucket.cdacprojectg5.id
  acl    = "public-read"
}

# Upload index.html
resource "aws_s3_object" "index" {
  bucket        = aws_s3_bucket.cdacprojectg5.id
  key           = "index.html"
  source        = "index.html"
  acl           = "public-read"
  content_type  = "text/html"
}

# Upload error.html
resource "aws_s3_object" "error" {
  bucket        = aws_s3_bucket.cdacprojectg5.id
  key           = "error.html"
  source        = "error.html"
  acl           = "public-read"
  content_type  = "text/html"
}

# Upload style.css
resource "aws_s3_object" "style" {
  bucket        = aws_s3_bucket.cdacprojectg5.id
  key           = "style.css"
  source        = "style.css"
  acl           = "public-read"
  content_type  = "text/css"
}

# Upload script.js
resource "aws_s3_object" "script" {
  bucket        = aws_s3_bucket.cdacprojectg5.id
  key           = "script.js"
  source        = "script.js"
  acl           = "public-read"
  content_type  = "text/javascript"
}

# Enable S3 Static Website Hosting
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.cdacprojectg5.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}

provider "aws" {
  region = var.region
}

resource "s3" "bucketlifecyle" {
  bucket = "bucket-lifecyle"
  acl = true
  lifecycle {
    prevent_destroy = true
    ignore_changes = [ tags, acl ]
    create_before_destroy = true
  }
}
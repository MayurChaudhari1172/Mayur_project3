provider "aws" {
  region = var.region
}

module "s3_bucket" {
  source            = "../../Modules/S3/V0"
  bucket_name       = var.bucket_name
  enable_versioning = var.enable_versioning
  enable_encryption = var.enable_encryption
  tags              = var.tags
}

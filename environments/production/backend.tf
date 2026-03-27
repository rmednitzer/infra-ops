# Production state backend.
# Remote backend configuration is required for production.
# Replace the placeholder values with your actual backend endpoint before use.
#
# Example using S3-compatible backend (e.g., MinIO, Ceph RGW):
#
# terraform {
#   backend "s3" {
#     bucket                      = "infra-ops-tfstate"
#     key                         = "production/terraform.tfstate"
#     region                      = "us-east-1"
#     endpoint                    = "https://s3.example.com"
#     skip_credentials_validation = true
#     skip_metadata_api_check     = true
#     skip_region_validation      = true
#     force_path_style            = true
#
#     # State locking via DynamoDB (or compatible)
#     dynamodb_table = "infra-ops-tfstate-lock"
#
#     # Encryption at rest is mandatory for production
#     encrypt = true
#   }
# }

# Placeholder: configure the backend before deploying production infrastructure.
terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

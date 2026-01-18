terraform {
  backend "s3" {
    bucket               = "ak-terraform-state-tywr-001"
    key                  = "core/terraform.tfstate"
    region               = "us-east-1"
    dynamodb_table       = "terraform-locks"
    encrypt              = true
    workspace_key_prefix = "core"
  }
}

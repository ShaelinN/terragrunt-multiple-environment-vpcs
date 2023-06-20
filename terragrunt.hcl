locals {
    bucket_name = "nshaelin-terraform-terragrunt-backend-bucket"
    aws_region = "af-south-1"
    dynamodb_table = "nshaelin-terraform-terragrunt-backend-lock-table"

    aws_profile = "AdministratorAccess-427519652828"
}

remote_state {
    backend = "s3"
    config = {
        encrypt        = true
        bucket         = "${local.bucket_name}"
        key            = "${path_relative_to_include()}/terraform.tfstate"
        region         = local.aws_region
        dynamodb_table = local.dynamodb_table
        profile = "${local.aws_profile}"
    }
    generate = {
        path      = "backend.tf"
        if_exists = "overwrite_terragrunt"
    }
}

generate "provider" {
    path = "provider.tf"
    if_exists = "overwrite_terragrunt"

    contents = <<EOF
        provider "aws" {
            region = ${local.aws_region}
            profile = ${local.aws_profile}
        }
    EOF    
}
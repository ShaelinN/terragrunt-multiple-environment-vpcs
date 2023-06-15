locals {
    bucket_name = "nshaelin-terraform-backend-bucket"
    key = "terraform.tfstate"
    aws_region = "af-south-1"
    //dynamodb_table = "nshaelin-terraform-backend-lock-table"

    aws_profile = "AdministratorAccess-427519652828"
    //shared_credentials_file = "~/.aws/credentials"
}

remote_state {
    backend = "s3"
    config = {
        //encrypt        = true
        bucket         = "${local.bucket_name}"
        key            = "${path_relative_to_include()}/terraform.tfstate"
        region         = local.aws_region
        //dynamodb_table = "terraform-locks"
        profile = "${local.aws_profile}"
    }
    generate = {
        path      = "backend.tf"
        if_exists = "overwrite_terragrunt"
    }
}
/*
generate "backend" {
    path = "backend.tf"
    if_exists = "overwrite_terragrunt"

    contents = <<EOF
        terraform {
            backend "s3" {
                bucket = "${local.bucket_name}"
                key = "${path_relative_to_include()}/${local.key}"
                region = "${local.region}"
                //encrypt = true
                //dynamodb_table = "${local.dynamodb_table}"
                profile = "${local.aws_profile}"
                //shared_credentials_file = "${local.shared_credentials_file}"
            }
        }
    EOF
}*/
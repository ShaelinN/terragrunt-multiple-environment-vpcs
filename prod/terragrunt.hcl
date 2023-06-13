locals {
    aws_profile = read_terragrunt_config(find_in_parent_folders("profile.hcl"))
}

terraform {
    source = "github.com/ShaelinN/terraform-vpcs-module"
}

inputs = {
    aws_profile = local.aws_profile.locals.aws_profile
    environment_name = "prod"
}
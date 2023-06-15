terraform {
    source = "github.com/ShaelinN/terraform-vpcs-module"
}

include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
  expose = true
}

inputs = {
    aws_profile = include.root.locals.aws_profile
    //shared_credentials_file = include.root.locals.shared_credentials_file
    environment_name = "qa"
}
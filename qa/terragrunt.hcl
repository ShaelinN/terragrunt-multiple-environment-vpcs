terraform {
    source = "github.com/ShaelinN/terraform-vpcs-module"
}

include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
  expose = true
}

inputs = {
    environment_name = "qa"
}
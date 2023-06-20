#!bin/bash
sudo rm -rf dev/.terragrunt-cache
sudo rm -rf prod/.terragrunt-cache
sudo rm -rf qa/.terragrunt-cache
sudo rm -rf .terraform

sudo rm dev/.terraform.lock.hcl
sudo rm prod/.terraform.lock.hcl
sudo rm qa/.terraform.lock.hcl
sudo rm .terraform.lock.hcl

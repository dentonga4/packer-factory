#!/bin/bash

# Description: This script will provision a temporary VPC in your AWS account. 
# All packer definitons in this directory will be applied and the VPC will be 
# terminated following completion.

# Ensure required packages are installed.
commands='terraform packer aws'
for command in $commands; do
    if ! command -v command 2>&1 >/dev/null
        then
        echo "ERROR: Packer installation could not be found"
        exit 1
    fi
done

# Ensure AWS_PROFILE environment variable has been set
if [[ -z "${AWS_PROFILE}" ]]; then
    echo "ERROR: Environment Variable AWS_PROFILE unset"
    exit 1
fi


# Ensure AWS_REGION environment variable has been set
if [[ -z "${AWS_REGION}" ]]; then
    echo "ERROR: Environment Variable AWS_REGION unset"
    exit 1
fi

# Provision AWS infrastructure required for Packer builds
(cd terraform/ && terraform init)
(cd terraform/ && terraform apply --auto-approve=true)

# Run Packer and build machine images
for filename in ./*.json; do
    packer build $filename || true
done

# Remove infrastructure required for Packer builds
(cd terraform/ && terraform destroy --auto-approve=true)


# TechDebt: Add AMI Validation Step - Check if  AMI built
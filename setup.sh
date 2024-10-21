#!/bin/bash

# Provision AWS infrastructure required for Packer builds
(cd terraform/ && terraform init)
(cd terraform/ && terraform apply --auto-approve=true)

# Run Packer and build machine images
for filename in ./*.json; do
    packer build $filename
done

# Remove infrastructure required for Packer builds
(cd terraform/ && terraform destroy --auto-approve=true)

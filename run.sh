#!/bin/bash

if [[ -z "${AWS_PROFILE}" ]]; then
    echo "ERROR: Environment Variable AWS_PROFILE unset"
    exit 1
fi

if [[ -z "${AWS_REGION}" ]]; then
    echo "ERROR: Environment Variable AWS_REGION unset"
    exit 1
fi

# Provision AWS infrastructure required for Packer builds
(cd terraform/ && terraform init)
(cd terraform/ && terraform apply --auto-approve=true)

packer build squid_proxy.json
# Run Packer and build machine images
#for filename in ./*.json; do
#    packer build $filename
#done

# Remove infrastructure required for Packer builds
(cd terraform/ && terraform destroy --auto-approve=true)

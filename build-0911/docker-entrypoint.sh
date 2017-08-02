#!/bin/bash

#Exit immediately if a pipeline exits  with a non-zero status
set -e

if [ "$1" = 'plan' ]; then
    terraform init | grep 'empty' &> /dev/null
    if [ $? == 0 ]; then
       echo >&2 'The directory has no Terraform configuration files. '
       exit 1
    fi

    if [ ! -d "tmp-terraform-plans" ]; then
        mkdir tmp-terraform-plans
    fi
    terraform plan -module-depth=-1 -out=tmp-terraform-plans/$(git rev-parse HEAD).out
elif [ "$1" = 'apply' ]; then
    terraform apply tmp-terraform-plans/$(git rev-parse HEAD).out
    echo >&1 'remove plan: '$(git rev-parse HEAD).out
    rm -f tmp-terraform-plans/$(git rev-parse HEAD).out
else
    exec terraform "$@"
fi

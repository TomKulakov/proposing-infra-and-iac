# GCP Infrastructure for Gift Card App

### Description
Description diagram can be found here (TODO: create diagram and paste the link)
TODO: Add some short info about what does infrastructure conatins

# Development
terraform init --input=false -backend-config=./envs/$ENVIRONMENT.tfbackend;
terraform plan --input=false -var-file=./envs/$ENVIRONMENT.tfvars;

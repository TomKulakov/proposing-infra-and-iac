# GCP Infrastructure for Gift Card App

### Description
Description diagram can be found here (TODO: create diagram and paste the link)
TODO: Add some short info about what does infrastructure conatins

# Development
## Configuration
`./envs/` folder holds environment related variables and backend configuration (if separate states buckets are required).

## Init and plan:
terraform init --input=false -backend-config=./envs/$ENVIRONMENT.tfbackend;
terraform plan --input=false -var-file=./envs/$ENVIRONMENT.tfvars;

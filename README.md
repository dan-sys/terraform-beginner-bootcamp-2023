# Terraform Beginner Bootcamp 2023

## Semantic Versioning

In this project, semantic versioning will be used for its tagging. More info on what is semantic versioning can be found on [semver.org](https://semver.org)

The general format:

**MAJOR.MINOR.PATCH** e.g `1.0.1`

### Install Terraform CLI

Follow the instruction on [developer.hashicorp.com](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

Copy all the bash commands into a single file located in our ([./bin](./bin/install_tf_cli)).bin directory, to make a bash script for better portability. Make the script executable and invoke it from the ([gitpod.yml](.gitpod.yml))


### Install AWS CLI

The aws cli is automated in a bash script [/bin/install_aws_cli](./bin/install_aws_cli). Further instructions can be found on the aws documentation page.

#### Terraform Basics

Terraform providers and modules can be obtained from the Terraform registry at [registry.terraform.io](https://registry.terraform.io/)

- **Providers** is an interface to APIs (e.g AWS, AZURE, Kubernetes etc) that are available for creating cloud resources
- **Modules** are templates to make terraform configurations more resuable and portable

##### Terraform Commands

The basic set up of using Terraform is 3 main commands

###### terraform init

`terraform init` this command initializes the directory the main.tf file is located in. It downloads the binaries of the terraform providers specified in the main.tf file in the .terraform folder. It also creates a lock file for our project.

###### terraform plan

`terraform plan` this command comes after the initialization, it generates a changeset that describes our current infrastructure and the potential changes that will be made to the infrastructure.

This changeset is then passed to the `terraform apply` command.

###### terraform apply

`terraform apply` as implied executes the changeset generated from running terraform plan. It also creates the terraform.tfstate file which is the statefile (describes the current state of the infrastructure, it should not be modified by user or commited to a repository as it an contain sensitive info) 
To auto approve terraform apply, add the option to the command `terraform apply --auto-approve`

###### terraform destroy

This command `terraform destroy` destroys the resources created by the apply command. It is irreversible and requires an approval. To auto approve, add the auto-approve flag `terraform destroy --auto-approve`


























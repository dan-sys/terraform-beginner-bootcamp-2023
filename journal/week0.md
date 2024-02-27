# Terraform Beginner Bootcamp 2023 - week 0

## Table of Content

- [Semantic Versioning](#semantic-versioning)
- [Install Terraform CLI](#install-terraform-cli)
    * [Automating the installation](#automating-the-installation)
- [Install AWS CLI](#install-aws-cli)
- [Terraform Basics](#terraform-basics)
    + [Terraform Commands](#terraform-commands)
        * [terraform init](#terraform-init)
        * [terraform plan](#terraform-plan)
        * [terraform apply](#terraform-apply)
        * [terraform destroy](#terraform-destroy)
  * [Issues with Terraform Cloud login via CLI and Gitpod Workspace](#issues-with-terraform-cloud-login-via-cli-and-gitpod-workspace)


## Semantic Versioning

In this project, semantic versioning will be used for its tagging. More info on what is semantic versioning can be found on [semver.org](https://semver.org)

The general format:

**MAJOR.MINOR.PATCH** e.g `1.0.1`

## Install Terraform CLI

Follow the instruction on [developer.hashicorp.com](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

#### Automating the installation
Copy all the bash commands into a single file located in our ([./bin](./bin/install_tf_cli)).bin directory, to make a bash script for better portability. Make the script executable and invoke it from the ([gitpod.yml](.gitpod.yml))


## Install AWS CLI

The aws cli is automated in a bash script [/bin/install_aws_cli](./bin/install_aws_cli). Further instructions can be found on the aws documentation page.

## Terraform Basics

Terraform providers and modules can be obtained from the Terraform registry at [registry.terraform.io](https://registry.terraform.io/)

- **Providers** is an interface to APIs (e.g AWS, AZURE, Kubernetes etc) that are available for creating cloud resources
- **Modules** are templates to make terraform configurations more resuable and portable

#### Terraform Commands

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

### Issues with Terraform Cloud login via CLI and Gitpod Workspace

`terraform login` does not work as expected in the CLI to generate a terraform token, this could be an issue with the Gitpod workspace's VSCode in the browser being used. A workaround is to manually create a token in the Terraform cloud page 

```
https://app.terraform.io/app/settings/tokens?source=terraform-login
```
then create and open a file name [credentials.tfrc.json](home/gitpod/.terraform.d/credentials.tfrc.json). In this file we write a short json file to provide the generated terraform token for login

```json
    {
    "credentials":{
        "app.terraform.io":{
            "token": "PutyoumanuallygeneratedTokenhere"
        }
    }
}
```

This process has been automated with a bash script (/bin/generate_credentials.tfrc_json)[./bin/generate_credentials.tfrc_json]. The script checks that the `TERRAFORM_CLOUD_TOKEN` exists as an environment variable, it also checks for the directory required.

If the directory exists the credentials files is generated with the token included in it.

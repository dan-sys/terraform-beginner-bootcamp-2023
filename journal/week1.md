# Terraform Beginner Bootcamp 2023 - Week1

## Root Module Structure

Our root module is as follows:

```
├── PROJECT_ROOT
|
├── README.md
├── main.tf # infrastructure configuration
├── variables.tf # stores the input variables
├── providers.tf # the data of variables to be loaded in the project
├── outputs.tf # stores our outputs
├── README.md # readME for root modules
```

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform and Variables

### Terraform Cloud Variables

In Terraform Cloud, we can set two kinds of variables:

- Environment Variables -  authentication variables for the providers you are using (e.g. AWS credentials)

- Terraform Variables - variables that are usually set in a terraform.tfvars files

Terraform Cloud variables  can be set to be sensitive so that they do not show in the UI.

### Passing Terraform Input Variable

More information can be found [here](https://developer.hashicorp.com/terraform/language/values/variables)

#### -var flag

By adding the `-var` flag to the end of a terraform plan command. This is used to pass the variable value at the CLI level. This is also used to override a variable that has already been set in a .tfvars file, the CLI input will take precedence. e.g. `terraform plan -var bucket_tag="worldstar bucket"`

#### var-file flag

to be filled in later

#### terraform.tfvars

This file is the the default file that contains all the variables set in a project

#### terraform.auto.tfvars

similar to the terraform.tfvars file but special ... to be filled in later

#### order of terraform variables

The different ways of passing terraform variables have orders of precedence with the `-var` flag having the highest precedence.

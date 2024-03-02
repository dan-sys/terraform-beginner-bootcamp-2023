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

## Dealing with Configuration Drift

### Fix Missing Resources with Terraform Import

[Terraform Import](https://developer.hashicorp.com/terraform/cli/commands/import)

Using `terraform import` command you can retrieve resources if the cloud resource supports an import. Example `terraform import aws_s3_bucket.bucket bucket-name`

### Fix Manual Configuration
 
to be filled in later

### Terraform Refresh

The `-refresh-only` flag which can be used with a `terraform plan` or `terraform apply` is useful for when you make changes to the configuration but do not want to have any modification to the deployed infrastructure. This flag updates your state file while keeping your infrastructure intact. For example 
`terraform apply -refresh-only auto-approve`

## Terraform Modules

### Module Structure

It is preferable to have a `modules` directory when locally dveloping modules.

### Passing Input Variables to Modules

First and foremost, the module has to declare the terraform variables it requires in its own `variables.tf` file. After these variables can then be referenced whenever the module is being used. Example of a loacl module presented below:

```terraform
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  bucket_name = var.bucket_name
  bucket_tag = var.bucket_tag
}
```

### Modules sources

Different ways of using a terraform module in a project, it can be imported via the following sources:

- locally
- Github
- Terraform Registry

## Working with Files in Terraform

### Path Variables

In Terraform, a special variable `path` exists that allows us to reference local paths in our directory:
 - path.module : gets the path for the current module
 - path.root : gets the path for the root module

 More information can be found here [Special Path Variable](https://developer.hashicorp.com/terraform/language/expressions/references#filesystem-and-workspace-info)

 Example
 ``` terraform
resource "aws_s3_object" "index_object" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = "${path.root}/public/index.html"

}
 ```

 ### Validating Path VAriables

 Using the `fileexists` conditional expression, it is possibale to validate a filepath that is entered by the user. Example

 ```terraform
validation {
      condition = fileexists(var.error_html_filepath)
      error_message = "The path provided for this error.html does not exist."
    }
 ```

 ## Terraform Data Sources

Using this block, it is possible to source data from cloud resources. This is useful for referencing existing cloud resources without importing them.

[Data Sources](https://developer.hashicorp.com/terraform/language/data-sources)

 ### Terraform Locals

 Locals allow us to define local variables. There are useful for when there is a need to transform data into another format and have referenced a variable.

 ```terraform
locals {
  s3_origin_id = "MyS3Origin"
}
 ```
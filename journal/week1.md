# Terraform Beginner Bootcamp 2023 - Week1

## Root Module Structure

Our root module is as follows:
```
- PROJECT_ROOT
|
|-- main.tf # infrastructure configuration
|-- variables.tf # stores the input variables
|-- terraform.tfvars # the data of variables to be loaded in the project
|-- providers.tf # defined required providers and their configuration
|-- outputs.tf # stores our outputs
|-- README.md # required for root modules
```



[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)
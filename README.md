# Terraform Beginner Bootcamp 2023

## Table of Content

- [Installing Terraform CLI](#install-the-terraform-cli)
- [Working with env vars](#working-with-env-vars)
- [Env var scope](#scoping-of-env-vars)
- [AWS CLI installation](#aws-cli-installation)
- [Terraform basics](#terraform-basics)
- [Terraform Console](#terraform-console)
- [Terraform Init](#terraform-init)
- [Terraform Plan](#terraform-plan)
- [Terraform Apply](#terraform-apply)
- [Terraform Destroy](#terraform-destroy)
- [Terraform Issues with Gitpod](#issues-with-terraform-cloud-login-via-gitpod-workspace)
- [Setting alias using bash](#setting-an-alias-in-bash-profile)

### install the terraform cli

we set up the installation procedure in the install_terraform_cli file in the bin folder due to changes in the gpg keyring changes. therefore a more recent terraform installation was put in place and automated by placing it in the [gitpod.yml](.gitpod.yml) file

to make your [gitpod.yml](.gitpod.yml) file run the tasks contained in it at every restart of a stopped environment, use the **before** keyword and not the **init** keyword

### working with env vars

we can list all environment variables using the `env` command, these can be filtered by specific keywords by piping the env command with the `grep` command as follows:
`env | grep AWS`

### scoping of env vars

different terminals are not aware of env vars that are set in each other. to have a globally available env var that can persist across different and future terminals, you need to set the env var in your bash profile `.bash_profile`

### aws cli installation

aws cli is istalled using the bash script [`./bin/install_aws_cli`](./bin/install_aws_cli)

### Terraform basics

important website to remember is the terraform registryfound at [registry.terraform.io](https://registry.terraform.io/) . there you will find providers and modules.

- **Providers** are interfaces to APIs that allow us to create resources in terraform
- **Modules** means of making large amount of terraform code modular, portable and sharable

### Terraform console

we can see the list of all terraform commands in our console by typing `terraform` and enter

### Terraform Init

At the start of a new project, `terraform init` is run to download the binaries for the terraform providers that will be used in the project

### Terraform Plan

`terraform plan` command creates a changeset, about the state of our infrastructure and what will be changed.

### Terraform Apply

This will run the plan from above and pass the chnageset to be executed by terraform. An approval prompt requiring `yes` is required to confirm apply.

To automatically approve an apply, you can add the following arguments to the `terraform apply` command : `terraform apply --auto-approve`

### Terraform Destroy

This will destroy created resources. The auto approve flag can also be added to this command. e.g. `terraform destroy--auto-approve`

### Issues with Terraform Cloud Login via Gitpod Workspace

The `terraform login` command to connect your gitpod local development env to the terraform cloud does not work as advertised. Pressing the `P` key gives you access to the link where you can go generate the required token to authenticate the login. Upon the token generation, the workaround is to create a credentials.trfc.json file manually.

``` sh
touch /home/gitpod/.terraform.d/credentials.tfrc.json
```
after which you can open the file using
 
``` sh
open /home/gitpod/.terraform.d/credentials.tfrc.json
```
and then provide the following json structure in the file 

```json
{
    "credentials":{
        "app.terraform.io":{
            "token": "YourToeknGoesHereblahblahblah"
        }
    }
}
```
This workaround process can be automated by using a bash script that can be found in [bin/generate_tfrc_cred](bin/generate_tfrc_cred)

#### Setting an alias in bash profile

An alias can be set for a command in the `bash_profile` file which can be accessed as follows

``` sh
open ~/.bash_profile
```
append to the file this command to set the alias wanted e.g.

``` sh
alias tf="terraform"
```
this means that `tf` is now set as an alias for the `terraform` command. Remember to reload your shell after modifications by running

``` sh
source ~/.bash_profile
```

This process can also be automated using a bash script that can be found in the [bin/set_tf_alias](bin/set_tf_alias)
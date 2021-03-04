# Terraform

## Commands

```
terraform init                         -> for initialization and downloading plugins for providers
terraform validate                     -> for validating the tf files (HCL templates)
terraform fmt                          -> formatting the template
terraform plan -out demo.out           -> seeing the detailed configurations and outputting the required changes
terraform apply demo.out               -> applying the changes
terraform destroy                      -> destroys the infrastructure

terraform show                         -> shows the contents of tfState file
terraform state list                   -> shows the list of resources that are created

terraform destroy -target aws_ec2.demo -> destroys a particular target
terraform refresh                      -> refreshes the current state of resources and updates tfstate file..
terraform console                      -> debugging variables and their values

terraform output name                  -> outputting a particular attribute
terraform taint aws_instance.myec2     -> tainting a resource i.e on next plan it will be replaced with a new one



terraform plan -refresh=false -target=aws_security_group.allow_ssh_conn  -> way to avoaid numerous api calls while planning[Large infra]


```

## Guides

- Basics -> Deploying Infrastructure with Terraform
- Adding Variables and outputs -> Read, Generate, Modify configs
- Conditionals and dynamic_blocks -> count, locals, dynamic, functions
- Provsioners -> Local and Remote Provisioners
- Modules
- Workspaces

---

### 4 ways to pass variables

1. passing through cmd `terraform plan -var "instaceType=t2.micro"`
2. passing through a file `terraform plan -var-file="custom.tfvars"`
   _If you define terraform.tfvars,no need to pass var-file_
3. defaults we can pass default in variables file
4. passing as env vars
   ```
   windows -> setx TF_VAR_instancetype t2.micro
   linux   -> export TF_VAR_instancetype t2.micro
   ```

- Different variables in Terraform - [link](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/blob/master/variables.tf)
- you need to define a `terraform.tfvars` and pass the variables to make it work.
  ```
  # terraform.tfvars
  region       = "us-east-1"
  instanceType = "t2.micro"
  ```

### Graphical output

```
terraform graph > graph.dot
yum install graphviz
cat graph.dot | dot -Tsvg > graph.svg
```

### Changing the logs of TerraForm

```
export TF_LOG_PATH=/tmp/crash.log
export TF_LOG=TRACE
# warn, info, error, debug, trace
```

### Provisoners

- running remote-exec more than once [link1](https://stackoverflow.com/a/41310989/12210002) [link2](https://stackoverflow.com/a/57472281/12210002) [link3](https://stackoverflow.com/a/56040653/12210002)

- connection settings - [link](https://www.terraform.io/docs/language/resources/provisioners/connection.html)

### For-Each ([link](https://learn.hashicorp.com/tutorials/terraform/for-each?in=terraform/0-13&utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS))

```

# Map:

resource "azurerm_resource_group" "rg" {
  for_each = {
    a_group = "eastus"
    another_group = "westus2"
  }
  name     = each.key
  location = each.value
}

# Set of strings:

resource "aws_iam_user" "the-accounts" {
  for_each = toset( ["Todd", "James", "Alice", "Dottie"] )
  name     = each.key
}
```

### Dynamic and for block

- dynamic block > [link](https://www.terraform.io/docs/language/expressions/dynamic-blocks.html)
- for block > [link](https://www.terraform.io/docs/language/expressions/for.html)

### TerraForm Workspace commands

- by default, 'default' workspce will be present

```
terraform workspace -h
terraform workspace show
terraform workspace new dev
terraform workspace new prd
terraform workspace list
terraform workspace select dev

```

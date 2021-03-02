# Terraform

## Commands

```
terraform init                         -> for initialization and downloading plugins for providers
terraform validate                     -> for validating the tf files (HCL templates)
terraform fmt                          -> formatting the template
terraform plan -out demo.out           -> seeing the detailed configurations and outputting the required changes
terraform apply demo.out               -> applying the changes

terraform show                         -> shows the contents of tfState file
terraform state list                   -> shows the list of resources that are created

terraform destroy                      -> destroys the infrastructure
terraform destroy -target aws_ec2.demo -> destroys a particular target

terraform refresh                      -> refreshes the current state of resources and updates tfstate file..
```

## Guides

- Basics -> Deploying Infrastructure with Terraform
- Adding Variables and outputs -> Read, Generate, Modify configs

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

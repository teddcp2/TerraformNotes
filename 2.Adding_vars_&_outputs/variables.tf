variable "instanceType" {
  type        = string
  description = "Defining the instance type"
  default     = "t2.micro"
}

variable "region" {
  type        = string
  description = "Defining the available regions"
  default     = "us-east-1"
}

variable "ami" {
  type        = map(string)
  description = "finding the AMI id based on the region"
  default = {
    "us-east-1" : "ami-0915bcb5fa77e4892",
    "us-west-1" : "ami-066c82dabe6dd7f73",
    "ap-south-1" : "ami-0eeb03e72075b9bcc"
  }
}


# variable "region" {
#     type = list(string)
#     description = "Defining the available regions"
#     default = [ "us-east-1", "us-west-1", "ap-south-1"]
# }

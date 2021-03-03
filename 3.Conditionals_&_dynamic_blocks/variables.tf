variable "iam-user-name" {
  type        = list(string)
  description = "IAM user names"
  default     = ["tedd", "Sid", "Ricky"]
}

variable "region" {
  default = "ap-south-1"
}

variable "istest" {
  default = true
}

variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [8200, 8201, 8300, 9200, 9500]
}

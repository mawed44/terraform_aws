variable "aws_region" {
  type    = string
  default = "eu-west-3" # Paris
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "project_name" {
  type    = string
  default = "terraform-iac-gitops"
}
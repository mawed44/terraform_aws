variable "aws_region" {
  type    = string
  default = "eu-west-3" # Paris
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "project_name" {
  type    = string
  default = "terraform-iac-gitops"
}
module "vpc" {
  source = "../terraform-module-vpc"
  cost_code   = "foo"
  owner       = "ME"
  email       = "robotz@foo.com"
  vpc_network = "172.31.10.0/${var.cidr}"
  region      = "eu-west-1"
}

variable "cidr" {
  default = "24"
}

provider "aws" {
  # region  = "us-east-1" # 6 # This is mental...
  # region  = "us-east-2" # 3
  # region  = "us-west-1" # 2
  # region  = "eu-west-1" # 3
  # region  = "eu-west-2" # 2
  # region  = "eu-central-1" #3
  # region  = "ca-central-1" #2
  # region  = "ap-northeast-1" # 2
  # region  = "ap-northeast-2" # 2
  # region  = "ap-southeast-1" # 2
  # region  = "ap-southeast-2" # 2
  # region  = "ap-south-1" # 2
  # region  = "sa-east-1" # 2
}

data "aws_availability_zones" "available" {
  state = "available"
}

output "zones" {
  value = "${length(data.aws_availability_zones.available.names)}"
}

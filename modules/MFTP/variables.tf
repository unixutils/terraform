variable "department" {
  description = "Department name, eg: dev, marketing, sales, IT"
  type = string
}

variable "vpc1_cidr" {
  description = "CIDR Block for VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "subnet1_cidr" {
  description = "CIDR Block for Subnet"
  type = string
  default = "10.1.0.0/24"
}

variable "ami" {
  description = "AMI to use with EC2"
  type = string
  default = "ami-03190fe20ef6b1419" 
}

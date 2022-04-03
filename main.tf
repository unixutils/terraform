terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

module "goodluck_mftp" {
  source = "./modules/MFTP"
  department = "IT"
}




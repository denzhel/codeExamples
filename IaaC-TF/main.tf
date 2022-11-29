provider "aws" {
   region = "eu-west-1"

   default_tags {
      tags = {
         bootcamp = "15"
         created_by = "baryohaivaknin"
         managed_by = "terraform"
      }//End OF tags
   }//End OF default_tags
}//End OF "aws" provider

terraform {
    required_providers {
        aws = {
            version = "4.32.0"
            source = "hashicorp/aws"
        }//End OF aws
    }//End OF required_providers
   backend "s3" {
      bucket = "baryvee-tfstate-bucket"
      key = "terraform.tfstate"
      region = "eu-west-1"
   }
}//End OF terraform

module "Network" {
   source = "./Network"
   myIP = var.myIP
   cidrBlock_VPC = var.cidrBlock_VPC
   cidrBlock_Subnets = var.cidrBlock_Subnets
   instanceName = var.instanceName
   AZ = var.AZ
   wsPrefix = var.wsPrefix
}//End OF Network module
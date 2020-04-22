provider "aws" {
  region                  = "us-east-1"
}
terraform {
  backend "s3" {
    bucket = "nbiryukov-tf-state"
    key    = "kirillR/terraform.tfstate"
    region = "us-east-1"
  }
}
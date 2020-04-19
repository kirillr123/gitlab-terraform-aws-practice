provider "aws" {
  region                  = "us-east-1"
  profile                 = "default"
}
data "terraform_remote_state" "aws" {
  backend = "s3"
  config = {
    bucket = "nbiryukov-tf-state"
    key    = "kirillR/terraform.tfstate"
    region = "us-east-1"
  }
}

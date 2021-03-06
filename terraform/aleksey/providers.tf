provider "aws" {
  region = "us-east-1"
}

data "terraform_remote_state" "aws" {
  backend = "s3"
  config = {
    bucket = "nbiryukov-tf-state"
    key    = "testState/terraform.tfstate"
    region = "us-east-1"
  }
}

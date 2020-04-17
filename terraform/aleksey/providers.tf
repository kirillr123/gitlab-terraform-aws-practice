provider "aws" {
  region = "us-east-1"
  shared_credentials_file = "/Users/nikolaybiryukov/.aws/creds"
}

data "terraform_remote_state" "aws" {
  backend = "s3"
  config = {
    bucket = "nbiryukov-tf-state"
    key    = "testState/terraform.tfstate"
    region = "us-east-1"
  }
}

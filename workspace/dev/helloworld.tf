# copy from old place
provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}"
}


terraform {
  required_version = ">= 0.11.11"
  backend "s3" {
    bucket         = "terraform-state-bucket-tt"
    key            = "tt/terraform/state/helloworld/terraform-helloworld-tt.tfstate"
    region         = "us-west-1"
    profile        = "tp"
  }
}

module "TF_Module_VPC" {
  source = "../../terraform-code/terraform-vpc"
  cidr_block = "${var.cidr_block}"
  env = "${var.env}"
  project = "${var.project}"
  flow_bucket_arn = "${data.terraform_remote_state.brain.vpc_s3}"
}
# copy  paste from base project
data "terraform_remote_state" "brain" {
  backend = "s3"
config {
  bucket         = "terraform-state-bucket-tt"
  key            = "tt/terraform/state/brain/terraform-base-tt.tfstate"
  region         = "us-west-1"
  profile        = "tp"
  }
}
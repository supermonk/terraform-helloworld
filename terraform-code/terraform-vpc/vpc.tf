resource "aws_vpc" "vpc" {
  cidr_block       = "${var.cidr_block}"
  instance_tenancy = "dedicated"
  tags = {
    Name = "${var.project}-vpc-${var.env}"
  }
}
resource "aws_flow_log" "example" {
  log_destination      = "${var.flow_bucket_arn}"
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = "${aws_vpc.vpc.id}"
}
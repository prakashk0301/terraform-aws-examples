# Network configuration

# VPC creation
resource "aws_vpc" "terraform" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags = {
    Name = "vpc_http"
  }
}

# Subnet configuration
resource "aws_subnet" "http" {
  vpc_id       = "${aws_vpc.terraform.id}"
  cidr_block   = "${var.network_http["cidr"]}"
  tags         = {
    Name       = "subnet_http"
  }
  depends_on   = ["aws_internet_gateway.gw"]
}

# External gateway configuration
resource "aws_internet_gateway" "gw" {
  vpc_id       = "${aws_vpc.terraform.id}"
  tags         = {
    Name       = "internet_gateway"
  }
}
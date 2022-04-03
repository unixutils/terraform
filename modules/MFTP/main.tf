resource "aws_vpc" "vpc1" {
  cidr_block = "${var.vpc1_cidr}"
  
  tags = {
    name = "${var.department}"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id = "${aws_vpc.vpc1.id}"
  cidr_block = "${var.subnet1_cidr}"
  map_public_ip_on_launch = true

  tags = {
    name = "${var.department}"
  }
}

resource "aws_internet_gateway" "gateway1" {
  vpc_id = "${var.department}"

  tags = {
    name = "${var.department}"
  }
}

resource "aws_s3_bucket" "bucket1" {
  bucket = "${var.department}_bucket"

  tags = {
    name = "${var.department}"
  }
}

resource "aws_iam_role_policy" "s3_policy" {
  name = "s3_policy"
  role = aws_iam_role.ec2_role.id

  policy = "${file("files/s3-aws_iam_role_policy.json")}"
}

resource "aws_iam_role" "ec2_role" {
  name = "ec2_role"

  assume_role_policy = "${file("files/ec2-aws_iam_role.json")}"
}

resource "aws_iam_instance_profile" "instanceprofile1" {
  name = "instanceprofile1"
  role = "${aws_iam_role.ec2_role.name}"
}

resource "aws_instance" "ec2instance1" {
  ami = "${var.ami}"
  instance_type = "t2.micro"
  iam_instance_profile = "${aws_iam_instance_profile.instanceprofile1.name}"
}

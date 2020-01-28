resource "aws_vpc" "tfer--vpc-002D-0f99dfee4c107925f" {
  assign_generated_ipv6_cidr_block = "false"
  cidr_block                       = "10.0.0.0/16"
  enable_dns_hostnames             = "true"
  enable_dns_support               = "true"
  instance_tenancy                 = "default"

  tags = {
    Name = "AWS-REINVENT"
  }
}

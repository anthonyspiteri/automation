resource "aws_subnet" "tfer--subnet-002D-045e86018941542d7" {
  assign_ipv6_address_on_creation = "false"
  cidr_block                      = "10.0.0.0/24"
  map_public_ip_on_launch         = "false"

  tags = {
    Name = "Public subnet"
  }

  vpc_id = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-002D-0f99dfee4c107925f_id}"
}

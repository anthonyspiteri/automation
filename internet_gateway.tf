resource "aws_internet_gateway" "tfer--igw-002D-0a3e0b18d673a3af5" {
  vpc_id = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-002D-0f99dfee4c107925f_id}"
}

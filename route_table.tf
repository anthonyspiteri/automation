resource "aws_route_table" "tfer--rtb-002D-0b260036e9dda6cd1" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-0a3e0b18d673a3af5"
  }

  vpc_id = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-002D-0f99dfee4c107925f_id}"
}

resource "aws_route_table" "tfer--rtb-002D-0cd279259d475e51b" {
  vpc_id = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-002D-0f99dfee4c107925f_id}"
}

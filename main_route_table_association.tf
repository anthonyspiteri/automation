resource "aws_main_route_table_association" "tfer--vpc-002D-0f99dfee4c107925f" {
  route_table_id = "${data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-002D-0cd279259d475e51b_id}"
  vpc_id         = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-002D-0f99dfee4c107925f_id}"
}

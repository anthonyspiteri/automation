resource "aws_route_table_association" "tfer--subnet-002D-045e86018941542d7" {
  route_table_id = "${data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-002D-0b260036e9dda6cd1_id}"
  subnet_id      = "${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-002D-045e86018941542d7_id}"
}

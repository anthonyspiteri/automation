resource "aws_network_acl" "tfer--acl-002D-0c1b78c3f462568b0" {
  egress {
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = "0"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "-1"
    rule_no    = "100"
    to_port    = "0"
  }

  ingress {
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = "0"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "-1"
    rule_no    = "100"
    to_port    = "0"
  }

  subnet_ids = ["${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-002D-045e86018941542d7_id}"]
  vpc_id     = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-002D-0f99dfee4c107925f_id}"
}

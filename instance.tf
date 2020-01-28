resource "aws_instance" "tfer--i-002D-0b685f283ac07fa28_Consul" {
  ami                         = "ami-0c5bd5f74f9df4ca8"
  associate_public_ip_address = "false"
  availability_zone           = "us-east-2c"
  cpu_core_count              = "1"
  cpu_threads_per_core        = "2"

  credit_specification {
    cpu_credits = "unlimited"
  }

  disable_api_termination = "false"
  ebs_optimized           = "false"
  get_password_data       = "false"
  instance_type           = "t3a.small"
  ipv6_address_count      = "0"
  key_name                = "hashicorp"
  monitoring              = "false"
  private_ip              = "10.0.0.21"

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    iops                  = "100"
    volume_size           = "10"
    volume_type           = "gp2"
  }

  source_dest_check = "true"
  subnet_id         = "${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-002D-045e86018941542d7_id}"

  tags = {
    Name = "Consul"
  }

  tenancy                = "default"
  vpc_security_group_ids = ["${data.terraform_remote_state.local.outputs.aws_security_group_tfer--HashiCorpConsul_sg-002D-04c8079a56a171c4d_id}"]
}

resource "aws_instance" "tfer--i-002D-0efae83c49ddad297_VeeamBackupForAWS" {
  ami                         = "ami-0bdbd05be2dcfebcb"
  associate_public_ip_address = "true"
  availability_zone           = "us-east-2c"
  cpu_core_count              = "2"
  cpu_threads_per_core        = "1"

  credit_specification {
    cpu_credits = "standard"
  }

  disable_api_termination = "false"
  ebs_optimized           = "false"
  get_password_data       = "false"
  iam_instance_profile    = "VeeamBackupForAWS-VcbInstanceProfile-RDTMP1QL7Y8L"
  instance_type           = "t2.medium"
  ipv6_address_count      = "0"
  key_name                = "hashicorp"
  monitoring              = "false"
  private_ip              = "10.0.0.239"

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    iops                  = "100"
    volume_size           = "8"
    volume_type           = "gp2"
  }

  source_dest_check = "true"
  subnet_id         = "${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-002D-045e86018941542d7_id}"

  tags = {
    Name = "VeeamBackupForAWS"
  }

  tenancy                = "default"
  user_data_base64       = "YXJuOmF3czppYW06OjUyMjc2MjU2NTc2NTpyb2xlL1ZlZWFtQmFja3VwRm9yQVdTLVZlZWFtSW1wZXJzb25hdGlvblJvbGVWMS0xVEtZMEtFWUw0RUVVCmFybjphd3M6aWFtOjo1MjI3NjI1NjU3NjU6cm9sZS9WZWVhbUJhY2t1cEZvckFXUy1WZWVhbUluc3RhbmNlQmFja3VwUmVzdG9yZUFjY2Vzcy1WUjVVWEVZRzdRSjU="
  vpc_security_group_ids = ["${data.terraform_remote_state.local.outputs.aws_security_group_tfer--VeeamBackupForAWS-002D-VcbSecurityGroup-002D-RRP3WWVYW7XX_sg-002D-03e613aaf1cd81a3f_id}"]
}

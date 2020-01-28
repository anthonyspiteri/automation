resource "aws_security_group" "tfer--HashiCorpConsul_sg-002D-04c8079a56a171c4d" {
  description = "HashiCorp Consul"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  name   = "HashiCorpConsul"
  vpc_id = "vpc-0f99dfee4c107925f"
}

resource "aws_security_group" "tfer--VeeamBackupForAWS-002D-VcbSecurityGroup-002D-RRP3WWVYW7XX_sg-002D-03e613aaf1cd81a3f" {
  description = "Enable SSH \u0026 HTTPS access via ports 22 \u0026 443"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "443"
    protocol    = "tcp"
    self        = "false"
    to_port     = "443"
  }

  name   = "VeeamBackupForAWS-VcbSecurityGroup-RRP3WWVYW7XX"
  vpc_id = "vpc-0f99dfee4c107925f"
}

resource "aws_security_group" "tfer--default_sg-002D-01971735fa918bf31" {
  description = "default VPC security group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    from_port = "0"
    protocol  = "-1"
    self      = "true"
    to_port   = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "3389"
    protocol    = "tcp"
    self        = "false"
    to_port     = "3389"
  }

  name   = "default"
  vpc_id = "vpc-0f99dfee4c107925f"
}

resource "aws_security_group" "tfer--launch-002D-wizard-002D-1_sg-002D-0e6ba90379c4b8d26" {
  description = "launch-wizard-1 created 2020-01-17T19:55:05.967+08:00"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  name   = "launch-wizard-1"
  vpc_id = "vpc-0f99dfee4c107925f"
}

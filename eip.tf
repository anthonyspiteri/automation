resource "aws_eip" "tfer--eipalloc-002D-000d91c33728a5714" {
  public_ipv4_pool = "amazon"
  vpc              = "true"
}

resource "aws_eip" "tfer--eipalloc-002D-01e30de2a0433a0db" {
  public_ipv4_pool = "amazon"
  vpc              = "true"
}

resource "aws_eip" "tfer--eipalloc-002D-073464e82913c1c29" {
  instance          = "i-0efae83c49ddad297"
  network_interface = "eni-03dd301d25ccc6cde"
  public_ipv4_pool  = "amazon"
  vpc               = "true"
}

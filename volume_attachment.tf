resource "aws_volume_attachment" "tfer--i-002D-0efae83c49ddad297-003A--002F-dev-002F-sdb" {
  device_name = "/dev/sdb"
  instance_id = "i-0efae83c49ddad297"
  volume_id   = "vol-086e0768a9fb4dad0"
}

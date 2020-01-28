resource "aws_sns_topic_subscription" "tfer--subscription-002D-aafaa32c-002D-b8fd-002D-49b0-002D-9564-002D-711d4da15c26" {
  endpoint             = "arn:aws:sqs:ap-south-1:522762565765:veeam_cloud_backup_405b067133854e84a617b578682f4125"
  protocol             = "sqs"
  raw_message_delivery = "true"
  topic_arn            = "${data.terraform_remote_state.local.outputs.aws_sns_topic_tfer--veeam_cloud_backup_5dac02b6d6744054b1399f73125be26c_id}"
}

resource "aws_sns_topic_subscription" "tfer--subscription-002D-c519657d-002D-32be-002D-429d-002D-b289-002D-c17efb99b335" {
  endpoint             = "arn:aws:sqs:ap-south-1:522762565765:veeam_cloud_backup_ca01e4530d1448fd91c6d9deadadb415"
  protocol             = "sqs"
  raw_message_delivery = "true"
  topic_arn            = "${data.terraform_remote_state.local.outputs.aws_sns_topic_tfer--veeam_cloud_backup_50073947e98f43d2ba5dd213d88655c9_id}"
}

resource "aws_sns_topic_subscription" "tfer--subscription-002D-ffaebc35-002D-b7c2-002D-4840-002D-8f6d-002D-8dc3841baa0e" {
  endpoint             = "arn:aws:sqs:ap-south-1:522762565765:veeam_cloud_backup_401b260072c5418090726a9407403148"
  protocol             = "sqs"
  raw_message_delivery = "true"
  topic_arn            = "${data.terraform_remote_state.local.outputs.aws_sns_topic_tfer--veeam_cloud_backup_c52f0e841b6e42ae9863b158ca306bf6_id}"
}

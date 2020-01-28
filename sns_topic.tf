resource "aws_sns_topic" "tfer--veeam_cloud_backup_50073947e98f43d2ba5dd213d88655c9" {
  application_success_feedback_sample_rate = "0"
  http_success_feedback_sample_rate        = "0"
  lambda_success_feedback_sample_rate      = "0"
  name                                     = "veeam_cloud_backup_50073947e98f43d2ba5dd213d88655c9"
  policy                                   = "{\"Version\":\"2012-10-17\",\"Id\":\"2cfd9fb8-4ce5-4531-a5bb-78ef6c3487a7\",\"Statement\":[{\"Sid\":\"fea91661-b6d2-4991-80fb-4334123f0bb4\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"*\"},\"Action\":[\"SNS:GetTopicAttributes\",\"SNS:SetTopicAttributes\",\"SNS:AddPermission\",\"SNS:RemovePermission\",\"SNS:DeleteTopic\",\"SNS:Subscribe\",\"SNS:ListSubscriptionsByTopic\",\"SNS:Publish\",\"SNS:Receive\"],\"Resource\":\"arn:aws:sns:us-east-2:522762565765:veeam_cloud_backup_50073947e98f43d2ba5dd213d88655c9\",\"Condition\":{\"StringEquals\":{\"AWS:SourceOwner\":\"522762565765\"}}},{\"Sid\":\"TrustCWEToPublishEventsToMyTopic\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"events.amazonaws.com\"},\"Action\":\"sns:Publish\",\"Resource\":\"arn:aws:sns:us-east-2:522762565765:veeam_cloud_backup_50073947e98f43d2ba5dd213d88655c9\"}]}"
  sqs_success_feedback_sample_rate         = "0"
}

resource "aws_sns_topic" "tfer--veeam_cloud_backup_5dac02b6d6744054b1399f73125be26c" {
  application_success_feedback_sample_rate = "0"
  http_success_feedback_sample_rate        = "0"
  lambda_success_feedback_sample_rate      = "0"
  name                                     = "veeam_cloud_backup_5dac02b6d6744054b1399f73125be26c"
  policy                                   = "{\"Version\":\"2012-10-17\",\"Id\":\"ed5b6b3a-9b4b-4d15-b460-7d5a8657b62b\",\"Statement\":[{\"Sid\":\"2d2064c6-c0b9-41cc-a684-a06459d9ffdd\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"*\"},\"Action\":[\"SNS:GetTopicAttributes\",\"SNS:SetTopicAttributes\",\"SNS:AddPermission\",\"SNS:RemovePermission\",\"SNS:DeleteTopic\",\"SNS:Subscribe\",\"SNS:ListSubscriptionsByTopic\",\"SNS:Publish\",\"SNS:Receive\"],\"Resource\":\"arn:aws:sns:us-east-2:522762565765:veeam_cloud_backup_5dac02b6d6744054b1399f73125be26c\",\"Condition\":{\"StringEquals\":{\"AWS:SourceOwner\":\"522762565765\"}}},{\"Sid\":\"TrustCWEToPublishEventsToMyTopic\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"events.amazonaws.com\"},\"Action\":\"sns:Publish\",\"Resource\":\"arn:aws:sns:us-east-2:522762565765:veeam_cloud_backup_5dac02b6d6744054b1399f73125be26c\"}]}"
  sqs_success_feedback_sample_rate         = "0"
}

resource "aws_sns_topic" "tfer--veeam_cloud_backup_c52f0e841b6e42ae9863b158ca306bf6" {
  application_success_feedback_sample_rate = "0"
  http_success_feedback_sample_rate        = "0"
  lambda_success_feedback_sample_rate      = "0"
  name                                     = "veeam_cloud_backup_c52f0e841b6e42ae9863b158ca306bf6"
  policy                                   = "{\"Version\":\"2012-10-17\",\"Id\":\"25858709-7960-4ffc-b41e-ae3f4f7104a1\",\"Statement\":[{\"Sid\":\"5efe27c0-0fdd-46a8-bbc1-564d3126d973\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"*\"},\"Action\":[\"SNS:GetTopicAttributes\",\"SNS:SetTopicAttributes\",\"SNS:AddPermission\",\"SNS:RemovePermission\",\"SNS:DeleteTopic\",\"SNS:Subscribe\",\"SNS:ListSubscriptionsByTopic\",\"SNS:Publish\",\"SNS:Receive\"],\"Resource\":\"arn:aws:sns:us-east-2:522762565765:veeam_cloud_backup_c52f0e841b6e42ae9863b158ca306bf6\",\"Condition\":{\"StringEquals\":{\"AWS:SourceOwner\":\"522762565765\"}}},{\"Sid\":\"TrustCWEToPublishEventsToMyTopic\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"events.amazonaws.com\"},\"Action\":\"sns:Publish\",\"Resource\":\"arn:aws:sns:us-east-2:522762565765:veeam_cloud_backup_c52f0e841b6e42ae9863b158ca306bf6\"}]}"
  sqs_success_feedback_sample_rate         = "0"
}

resource "aws_s3_bucket" "tfer--veeam-002D-ps-002D-ct01" {
  acl            = "private"
  arn            = "arn:aws:s3:::veeam-ps-ct01"
  bucket         = "veeam-ps-ct01"
  force_destroy  = "false"
  hosted_zone_id = "Z2O1EMRO9K5GLX"
  region         = "us-east-2"
  request_payer  = "BucketOwner"

  versioning {
    enabled    = "true"
    mfa_delete = "false"
  }
}

resource "aws_s3_bucket" "tfer--veeam-002D-ps-002D-ct02" {
  acl            = "private"
  arn            = "arn:aws:s3:::veeam-ps-ct02"
  bucket         = "veeam-ps-ct02"
  force_destroy  = "false"
  hosted_zone_id = "Z2O1EMRO9K5GLX"
  region         = "us-east-2"
  request_payer  = "BucketOwner"

  versioning {
    enabled    = "true"
    mfa_delete = "false"
  }
}

resource "aws_s3_bucket" "tfer--veeam-002D-ps-002D-v10-002D-01" {
  acl            = "private"
  arn            = "arn:aws:s3:::veeam-ps-v10-01"
  bucket         = "veeam-ps-v10-01"
  force_destroy  = "false"
  hosted_zone_id = "Z2O1EMRO9K5GLX"
  region         = "us-east-2"
  request_payer  = "BucketOwner"

  versioning {
    enabled    = "false"
    mfa_delete = "false"
  }
}

resource "aws_s3_bucket" "tfer--veeam-002D-ps-002D-v10-002D-02" {
  acl            = "private"
  arn            = "arn:aws:s3:::veeam-ps-v10-02"
  bucket         = "veeam-ps-v10-02"
  force_destroy  = "false"
  hosted_zone_id = "Z2O1EMRO9K5GLX"

  object_lock_configuration {
    object_lock_enabled = "Enabled"
  }

  region        = "us-east-2"
  request_payer = "BucketOwner"

  versioning {
    enabled    = "true"
    mfa_delete = "false"
  }
}

resource "aws_s3_bucket" "tfer--veeam-002D-ps-002D-v10-002D-98" {
  acl            = "private"
  arn            = "arn:aws:s3:::veeam-ps-v10-98"
  bucket         = "veeam-ps-v10-98"
  force_destroy  = "false"
  hosted_zone_id = "Z2O1EMRO9K5GLX"

  object_lock_configuration {
    object_lock_enabled = "Enabled"

    rule {
      default_retention {
        days  = "1"
        mode  = "COMPLIANCE"
        years = "0"
      }
    }
  }

  region        = "us-east-2"
  request_payer = "BucketOwner"

  versioning {
    enabled    = "true"
    mfa_delete = "false"
  }
}

resource "aws_s3_bucket" "tfer--veeam-002D-ps-002D-v10-002D-99" {
  acceleration_status = "Enabled"
  acl                 = "private"
  arn                 = "arn:aws:s3:::veeam-ps-v10-99"
  bucket              = "veeam-ps-v10-99"
  force_destroy       = "false"
  hosted_zone_id      = "Z2O1EMRO9K5GLX"

  object_lock_configuration {
    object_lock_enabled = "Enabled"
  }

  region        = "us-east-2"
  request_payer = "BucketOwner"

  versioning {
    enabled    = "true"
    mfa_delete = "false"
  }
}

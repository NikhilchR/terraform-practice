provider "aws" {
  region = "us-east-1"  # adjust as needed
}

# Create IAM Group
resource "aws_iam_group" "dev_team" {
  name = "dev-team"
}

# Attach AWS Managed Policy to IAM Group
resource "aws_iam_group_policy_attachment" "dev_team_s3_readonly" {
  group      = aws_iam_group.dev_team.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_group_policy" "custom_policy" {
  name  = "custom-inline-policy"
  group = aws_iam_group.dev_team.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = ["s3:ListAllMyBuckets"]
        Effect = "Allow"
        Resource = "*"
      }
    ]
  })
}

{
"Version": "2012-10-17",
"Id": "PutObjPolicy",
"Statement": [{
  "Sid": "DenyObjectsThatAreNotSSEKMS",
  "Principal": "*",
  "Effect": "Deny",
  "Action": "s3:PutObject",
  "Resource": "arn:aws:s3:::amzn-s3-demo-bucket/*",
  "Condition": {
    "Null": { #ArnNotEqualsIfExists
      "s3:x-amz-server-side-encryption-aws-kms-key-id": "true"
    }
  }
}]
}
#aws s3 cp s3://my-dev-bucket/config.json .
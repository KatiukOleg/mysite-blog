resource "aws_s3_bucket" "bucket_for_static" {
  bucket = "${var.Project}-${lower("${var.Environment}")}-static-1kom4kd"

  tags = {
    Environment = "${var.Environment}"
    Project = "${var.Project}"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket_for_static.id
  acl = "public-read-write"
}

resource "aws_s3_bucket_policy" "public_s3_policy" {
  bucket = aws_s3_bucket.bucket_for_static.id
  policy = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Resource": "${aws_s3_bucket.bucket_for_static.arn}/*"
    }
  ]
}
EOT  
}
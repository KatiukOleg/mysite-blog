resource "aws_s3_bucket" "bucket_for_static" {
  bucket = "${var.Project}-${lower("${var.Environment}")}-${var.BucketUniqueSuffix}"

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

resource "aws_ssm_parameter" "parameter_for_bucket" {
  name = "${var.Project}-${lower("${var.Environment}")}-static-bucket"
  type = "String"
  value = "${var.Project}-${lower("${var.Environment}")}-${var.BucketUniqueSuffix}"
  tags = {
    Environment = "${var.Environment}"
    Project = "${var.Project}"
  }
}

resource "aws_ssm_parameter" "parameter_for_secret_key" {
  name = "${var.Project}-${lower("${var.Environment}")}-secret-key"
  type = "SecureString"
  value = "${var.SecretKey}"
  tags = {
    Environment = "${var.Environment}"
    Project = "${var.Project}"
  }
}
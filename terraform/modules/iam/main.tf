module "storage" {
    source = "../storage"
}

resource "aws_iam_user" "django_user" {
  name = "django.usertest"
  path = "/"

  tags = {
    Environment = "${var.Environment}"
    Project = "${var.Project}"
  }
}

data "aws_iam_policy" "AmazonS3FullAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_user_policy_attachment" "django_user_policy_attachment" {
  user = aws_iam_user.django_user.name
  policy_arn = data.aws_iam_policy.AmazonS3FullAccess.arn
}

# resource "aws_iam_access_key" "django_user_key" {
#   user = aws_iam_user.django_user.name
#   pgp_key = 
# }

resource "aws_iam_policy" "managed_policy" {
  name = "${var.Project}-${var.Environment}-managed-policy"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ssm:Describe*",
        "ssm:Get*",
        "ssm:List*"
      ],
      "Effect": "Allow",
      "Resource": "${module.storage.static_bucket_parameter}"
    },
    {
      "Action": [
        "iam:DeleteAccessKey"
      ],
      "Effect": "Allow",
      "Resource": "${aws_iam_user.django_user.arn}"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "attach_managed_policy" {
  name = "attach_managed_policy"
  users = [aws_iam_user.django_user.name]
  policy_arn = aws_iam_policy.managed_policy.arn
}
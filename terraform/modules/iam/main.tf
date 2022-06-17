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
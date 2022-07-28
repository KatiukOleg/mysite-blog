output "static_bucket_parameter" {
  value = aws_ssm_parameter.parameter_for_bucket.arn
  description = "ARN of ssm parameter for static bucket"
}

output "secret_key_parameter" {
  value = aws_ssm_parameter.parameter_for_secret_key.arn
  description = "ARN of ssm parameter for secret key"
}
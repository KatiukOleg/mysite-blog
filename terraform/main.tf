module "iam" {
    source = "./modules/iam"

    Region = var.AWS_REGION
    Environment = var.Environment
    Project = var.Project
}
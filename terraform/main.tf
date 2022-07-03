# module "storage" {
#     source = "./modules/storage"

#     Region = var.AWS_REGION
#     Environment = var.Environment
#     Project = var.Project
# }

module "iam" {
    source = "./modules/iam"

    Region = var.AWS_REGION
    Environment = var.Environment
    Project = var.Project
}


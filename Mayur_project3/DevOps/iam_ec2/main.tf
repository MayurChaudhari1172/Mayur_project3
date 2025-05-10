module "shared_ec2_role" {
  source             = "../../Modules/IAM/V0"
  role_name          = var.role_name
  service_principals = var.service_principals
  tags               = var.tags
}

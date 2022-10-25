module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.0"

  name                 = "${var.service_name}"
  cidr                 = var.vpc_cidr
  azs                  = var.azs
  public_subnets       = var.public_subnets_cidr
  private_subnets      = var.private_subnets_cidr
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    Name    = "${var.service_name}-public"
    Service = var.service_name
  }
  private_subnet_tags = {
    Name    = "${var.service_name}-private"
    Service = var.service_name
  }

  tags = {
    Name    = "${var.service_name}"
    Service = var.service_name
  }
}

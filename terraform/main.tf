# Get local information regarding the AWS account
data "aws_caller_identity" "current" {}

# EKS official module to create the basic infrastructure with best practices
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.30"

  cluster_name    = var.service_name
  cluster_version = "1.23"

  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = concat(module.vpc.public_subnets, module.vpc.private_subnets)

  # Fargate Profile(s)
  fargate_profiles = {
    isbn-backend = {
      name = "isbn-backend"
      selectors = [
        {
          namespace = "isbn-backend"
        }
      ]
      subnet_ids = module.vpc.private_subnets
    }
   kube_system = {
      name = "kube-system"
      selectors = [
        { namespace = "kube-system" }
      ]
      subnet_ids = module.vpc.private_subnets
    }
  }

  aws_auth_accounts = [data.aws_caller_identity.current.account_id]

  tags = {
    Name    = "${var.service_name}"
    Service = var.service_name
  }
}

module "load_balancer_controller_irsa_role" {
  source = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"

  role_name                              = "load-balancer-controller"
  attach_load_balancer_controller_policy = true

  oidc_providers = {
    ex = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["kube-system:aws-load-balancer-controller"]
    }
  }
}

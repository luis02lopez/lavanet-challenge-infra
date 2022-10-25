variable "service_name" {
  type        = string
  description = "Name of the service/project"
  default     = "lavanet"
}

variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "Name of the AWS region"
}

variable "vpc_cidr" {
  description = "CIDR of the VPC to create."
  default = "11.1.0.0/16"
}

variable "azs" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  description = "List of availability zones to use in the region. Defaults to ['us-east-1a', 'us-east-1b', 'us-east-1c']"
}

variable "public_subnets_cidr" {
  type        = list(string)
  description = "List of CIDR's to use for the public subnets"
  default = [ "11.1.0.0/24", "11.1.1.0/24", "11.1.2.0/24" ]
}

variable "private_subnets_cidr" {
  type        = list(string)
  description = "List of CIDR's to use for the private subnets"
  default = [ "11.1.3.0/24", "11.1.4.0/24", "11.1.5.0/24" ]
}



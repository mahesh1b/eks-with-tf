module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.project_name}_vpc"
  cidr = "192.168.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["192.168.1.0/24", "192.168.2.0/24"]
  public_subnets  = ["192.168.101.0/24", "192.168.102.0/24"]

  map_public_ip_on_launch = true
  enable_dns_support      = true
  enable_dns_hostnames    = true
}
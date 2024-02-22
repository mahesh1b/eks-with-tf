#EKS Cluster
resource "aws_eks_cluster" "eks" {
  name     = "${var.project_name}_k8s_cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = true
    subnet_ids              = concat(module.vpc.public_subnets, module.vpc.private_subnets)
  }

  access_config {
    authentication_mode                         = "API_AND_CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
  }
}

#EKS Add-ons
resource "aws_eks_addon" "amazon-vpc-cni" {
  cluster_name = aws_eks_cluster.eks.name
  addon_name   = "vpc-cni"
}
resource "aws_eks_addon" "codedns" {
  cluster_name = aws_eks_cluster.eks.name
  addon_name   = "coredns"
}
resource "aws_eks_addon" "kube-proxy" {
  cluster_name = aws_eks_cluster.eks.name
  addon_name   = "kube-proxy"
}

#EKS Node Group
resource "aws_eks_node_group" "ng" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "${var.project_name}_node_group"
  node_role_arn   = aws_iam_role.eks_node_group_role.arn
  subnet_ids      = module.vpc.public_subnets
  instance_types  = ["${var.instance_type}"]
  capacity_type   = "ON_DEMAND"
  disk_size       = "20"

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_node
    min_size     = var.min_node
  }

  update_config {
    max_unavailable = var.max_unavailable
  }

}

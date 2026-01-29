#EKS-CLuster
resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  depends_on = [
    aws_iam_role_policy_attachment.cluster_policy
  ]
}

#policy-dependency
resource "aws_iam_role_policy_attachment" "cluster_policy" {
  role       = split("/", var.cluster_role_arn)[1]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

#managed-node-groups
resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "kubeforge-ng"
  node_role_arn  = var.node_role_arn
  subnet_ids     = var.subnet_ids

  scaling_config {
    desired_size = 1
    max_size     = 3
    min_size     = 1
  }

  instance_types = ["t3.micro"]

  depends_on = [
    aws_eks_cluster.this
  ]
}

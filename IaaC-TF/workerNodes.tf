resource "aws_eks_node_group" "baryvee-worker-nodes-group" {
  cluster_name  = aws_eks_cluster.baryvee-eks-cluster.name
  node_group_name = "baryvee-worker-nodes-group"
  node_role_arn  = aws_iam_role.baryvee-worker-nodes.arn
  subnet_ids = module.Network.subnetsID[*]
  instance_types = [var.instanceType]
 
  scaling_config {
   desired_size = var.scalingDesiredSize
   max_size   = var.scalingMaxSize
   min_size   = var.scalingMinSize
  }//End OF scaling_config
 
  depends_on = [
   aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
   aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
   aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]//End OF depends_on
}//End OF baryvee-worker-nodes-group

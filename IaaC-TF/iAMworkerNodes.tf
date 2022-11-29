resource "aws_iam_role" "baryvee-worker-nodes" {
  name = "baryvee-worker-nodes"
 
  assume_role_policy = jsonencode({
   Statement = [{
    Action = "sts:AssumeRole"
    Effect = "Allow"
    Principal = {
     Service = "ec2.amazonaws.com"
    }
   }]
   Version = "2012-10-17"
  })
}//End OF baryvee-worker-nodes

//Attaching Policies To IAM Role -> 'baryvee-worker-nodes'
resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
    policy_arn  = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    role        = aws_iam_role.baryvee-worker-nodes.name
}//End OF AmazonEKSWorkerNodePolicy Policy

resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
    policy_arn  = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    role        = aws_iam_role.baryvee-worker-nodes.name
}//End OF AmazonEKS_CNI_Policy Policy

resource "aws_iam_role_policy_attachment" "EC2InstanceProfileForImageBuilderECRContainerBuilds" {
    policy_arn  = "arn:aws:iam::aws:policy/EC2InstanceProfileForImageBuilderECRContainerBuilds"
    role        = aws_iam_role.baryvee-worker-nodes.name
}//End OF EC2InstanceProfileForImageBuilderECRContainerBuilds Policy
 
resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
    policy_arn  = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    role        = aws_iam_role.baryvee-worker-nodes.name
}//End OF AmazonEC2ContainerRegistryReadOnly Policy

resource "aws_iam_role_policy_attachment" "ebsDriverWorkerNodesPolicy" {
   policy_arn = "arn:aws:iam::644435390668:policy/baryvee-ebsDriverPolicy"
   role = aws_iam_role.baryvee-worker-nodes.name
}//End OF ebsDriverPolicy Policy
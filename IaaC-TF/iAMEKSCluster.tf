resource "aws_iam_role" "baryvee-eks-iam-role" {
 name = "baryvee-eks-iam-role"

 path = "/"

 assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
  {
   "Effect": "Allow",
   "Principal": {
    "Service": "eks.amazonaws.com"
   },
   "Action": "sts:AssumeRole"
  }
 ]
}
EOF
}//End OF baryvee-eks-iam-role

//Attaching Policies To IAM Role -> 'baryvee-eks-iam-role'
resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role    = aws_iam_role.baryvee-eks-iam-role.name
}//End OF AmazonEKSClusterPolicy Policy


resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly-EKS" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    role    = aws_iam_role.baryvee-eks-iam-role.name
}//End OF AmazonEC2ContainerRegistryReadOnly-EKS Policy

resource "aws_iam_role_policy_attachment" "ebsDriverClusterPolicy" {
   policy_arn = "arn:aws:iam::644435390668:policy/baryvee-ebsDriverPolicy"
   role = aws_iam_role.baryvee-eks-iam-role.name
}//End OF ebsDriverPolicy Policy

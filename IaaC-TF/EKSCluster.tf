resource "aws_eks_cluster" "baryvee-eks-cluster" {
    name = "baryvee-eks-cluster"
    role_arn = aws_iam_role.baryvee-eks-iam-role.arn
    vpc_config {
        subnet_ids = module.Network.subnetsID[*]
    }//End OF vpc_config

    depends_on = [
        aws_iam_role.baryvee-eks-iam-role,
    ]//End OF depends_on
}//End OF baryvee-eks-cluster
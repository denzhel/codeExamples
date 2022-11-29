provider "helm" {
  kubernetes {
    host                   = aws_eks_cluster.baryvee-eks-cluster.endpoint 
    cluster_ca_certificate = base64decode(aws_eks_cluster.baryvee-eks-cluster.certificate_authority[0].data)

    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", aws_eks_cluster.baryvee-eks-cluster.name]
      command     = "aws"
    }//End OF exec

  }//End OF kubernetes
}//End OF helm provider

resource "helm_release" "argocd" {
  name       = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = "default"
  version    = "5.8.3"

  values = [
    file("../values.yaml")
  ]//End OF values

  provisioner "local-exec" {
    command = "bash ../argoInit.sh"
  }//End OF local-exec
}//End OF argocd

//todo - find a way to use tf vars as a part of the local-exec part read about operator
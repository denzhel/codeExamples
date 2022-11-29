#!/bin/bash
region='eu-west-1'
clusterName='baryvee-eks-cluster'
userName=''
password=''
noipHost='baryvee2.ddns.net'
newIP=$(dig $(k get svc | grep "amazon" | awk -F ' ' '{print $4}') | grep "60 IN" | awk -F ' ' '{print $5}' | head -n1)

echo "Updating kubeconfig..."
aws eks --region $region update-kubeconfig --name $clusterName
echo "Applying a-o-a.yaml on argo..."
kubectl apply -f ../argoGitConf.yaml -f ../portfolio-gitops/a-o-a.yaml
echo "Updating new elb's IP on NO-IP..."
curl -u $userName:$password "http://dynupdate.no-ip.com/nic/update?hostname=$noipHost&myip=$newIP"
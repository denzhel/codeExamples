output "subnetsID" {
    value = tolist(aws_subnet.baryveeEKSPublicSN[*].id)
}//End OF subnetsID

output "subnetsName" {
  value = tolist(aws_subnet.baryveeEKSPublicSN[*])
}//End OF subnetsName

output "vpcID" {
    value = aws_vpc.baryveeEKSVPC.id
}//End OF vpcID
/*##################################_Creating VPC_#################################*/
resource "aws_vpc" "baryveeEKSVPC" {
   cidr_block = var.cidrBlock_VPC

   tags = {
      Name       = "${var.wsPrefix}-${var.instanceName}-VPC"
   }//End OF tags
}//End OF baryveeEKSVPC
/*##################################_End OF VPC_#################################*/

/*########################_Creating baryveeEKSPublicSN_#######################*/
resource "aws_subnet" "baryveeEKSPublicSN" {
   count = length(var.cidrBlock_Subnets) == 1 ? 1 : length(var.cidrBlock_Subnets)
   vpc_id            = "${aws_vpc.baryveeEKSVPC.id}"
   cidr_block        = element(var.cidrBlock_Subnets, count.index) 
   availability_zone = element(var.AZ, count.index)
   map_public_ip_on_launch = true
   tags = {
      Name       = "${var.wsPrefix}-${var.instanceName}-SN.${tostring(count.index+1)}" 
   }//End OF tags
}//End OF baryveeEKSPublicSN
/*########################_End OF baryveeEKSPublicSN_#######################*/

/*##########################_Creating baryveeIGW_#############################*/
resource "aws_internet_gateway" "baryveeIGW" {
    vpc_id = "${aws_vpc.baryveeEKSVPC.id}"

    tags = {
        Name       = "${var.wsPrefix}-${var.instanceName}-IGW"
    }//End OF tags
}//End OF baryveeIG
/*###########################_End OF baryveeIGW_############################*/

/*#########################_Creating baryveeRT_#############################*/
resource "aws_route_table" "baryveeRT" {
   vpc_id = "${aws_vpc.baryveeEKSVPC.id}"

   route {
      cidr_block = var.cidrBlock_All
      gateway_id = "${aws_internet_gateway.baryveeIGW.id}"
   }//End OF Route

  tags = {
      Name       = "${var.wsPrefix}-${var.instanceName}-RT"
   }//End OF tags
}//End OF baryveeRT
/*###########################_End OF baryveeRT_###############################*/

/*##################_Creating Association Between RT & SN_####################*/
resource "aws_route_table_association" "RTnSN" {
    count = length(var.cidrBlock_Subnets)
    subnet_id      = element(aws_subnet.baryveeEKSPublicSN[*].id, count.index)
    route_table_id = "${aws_route_table.baryveeRT.id}"
}//End OF RTnSN
/*##################_End OF Association Between RT & SN_######################*/

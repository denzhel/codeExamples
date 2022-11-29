/*###############_Instances Settings_###################*/
variable "instanceType" {
    default = "t3.xlarge"
}//End OF instanceType

variable "instanceName" {
    default = "baryveeEKS"
}//End OF instanceName

variable "instanceKeyName" {
    default = "baryveeIrelandKey"
}//End OF instanceKeyName

variable "wsPrefix" {}
/*###############_End OF Instances Settings_###################*/

/*######################_Networking_###########################*/
variable "myIP" {
    default = "84.111.217.78/32"
}//End OF myIP

variable "cidrBlock_VPC" {
    default = "10.0.0.0/16"
}//End OF cidrBlock_VPC

variable "cidrBlock_Subnets" {
    default = [ "10.0.0.0/24" , "10.0.100.0/24" ] 
}//End OF cidrBlock_Subnets
/*##########################_End OF Networking_###########################*/

/*########################_Nodes Configuration_###########################*/
variable "scalingDesiredSize" {
    default = "3"
}//End OF scalingDesiredSize

variable "scalingMaxSize" {
    default = "3"
}//End OF scalingMaxSize

variable "scalingMinSize" {
    default = "3"
}//End OF scalingMinSize
/*#####################_End OF Nodes Configuration_#######################*/

/*##########################_Availability Zone_###########################*/
variable "AZ" {
    default = [ "eu-west-1a" , "eu-west-1b" ]
}//End OF AZ
/*######################_End OF Availability Zone_########################*/
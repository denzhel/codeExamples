/*######################_Networking_###########################*/
variable "myIP" {
    type = string
}//End OF cideBlock_myIP

variable "cidrBlock_All" {
    type = string
    default = "0.0.0.0/0"
}//End OF cideBlock_All

variable "cidrBlock_VPC" {
    type = string
}//End OF cideBlock_VPC

variable "cidrBlock_Subnets" {
    type = list(string) 
}//End OF cideBlock_Subnets

/*##########################_End OF Networking_###########################*/

/*###############_Instances Settings_###################*/
variable "instanceName" {}
variable "wsPrefix" {}
/*###############_End OF Instances Settings_###################*/

/*##########################_Availability Zone_###########################*/
variable "AZ" {}
/*######################_End OF Availability Zone_########################*/
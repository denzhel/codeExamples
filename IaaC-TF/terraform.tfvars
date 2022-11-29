//Instances
instanceType = "t3.xlarge"
instanceKeyName = "baryveeIrelandKey"
instanceName = "baryveeEKS"

//Network
myIP = "84.111.217.78/32"
cidrBlock_VPC = "10.0.0.0/16"
cidrBlock_Subnets = ["10.0.0.0/24" , "10.0.100.0/24"]

//AZ
AZ = ["eu-west-1a" , "eu-west-1b"]

//Workspace Prefix
wsPrefix = "prod"

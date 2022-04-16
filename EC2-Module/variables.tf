variable "region"{
    type = list(string)
    description = "the region for the EC2 instance"
    default = ["us-east-1"]
}

variable "ec2count"{
    type    =           number
    description =       "sets number of instances" 
    default =           1
}


variable "keyname"{
    type = string
    default = "yay"
    description = "private key used for connection"
}
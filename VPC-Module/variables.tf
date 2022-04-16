variable "region"{
    type = list(string)
    description = "the region for the EC2 instance"
    default = ["us-east-1"]
}

variable "cidrblock"{
    type = string
    default = "100.64.0.0/16"
}

variable "public_cidrs"{
    type = list(string)
    default = ["100.64.0.0/24", "100.64.1.0/24","100.64.2.0/24"]
}

variable "private_cidrs"{
    type = list(string)
    default = ["100.64.3.0/24", "100.64.4.0/24","100.64.5.0/24"]
}

variable "az"{
    type = list(string)
    default = ["us-east-1a", "us-east-1b","us-east-1c"]
}
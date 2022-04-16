# terraform-aws
automated deployment of EC2s, VPC, subnet, IGW, and SG in AWS with terraform

This terraform project creates the following topology:

![GitHub Logo](https://i.imgur.com/dq2PeHW.png)

•	A new VPC is created. 
•	This VPC contains two subnets, one public and another private. 
•	A security group allows access via SSH and HTTP.
•	Two EC2 instances are created. They are webservers.
•	The EC2 in the public subnet and the other in the private.
•	The EC2s use the security group created in the other module.


# terraform-aws

This terraform project deploys the following topology (credits to Felix Carapaica for the diagram):

![GitHub Logo](https://i.imgur.com/dq2PeHW.png)

•	A new VPC is created. 

•	This VPC contains two subnets, one public and another private. 

•	A security group allows access via SSH and HTTP.

•	Two EC2 instances are created. They are webservers.

•	One EC2 is in the public subnet and the other is in the private subnet.

•	The EC2s use the security group created in the other module.



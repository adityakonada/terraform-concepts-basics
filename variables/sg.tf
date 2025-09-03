resource "aws_security_group" "roboshop-all" { #this is terraform name, for terraform reference only
  name        = "roboshop-all-aws" #this is for aws sg name
  description = "var.sg-description"
  #vpc_id      = aws_vpc.main.id #if not defined here, region's default vpc will be taken

ingress {
    description      = "Allow All ports"
    from_port        = var.inbound-from-port # variable decladed. 0 means all ports
    to_port          = 0 
    protocol         = "tcp"
    cidr_blocks      = var.cidr_blocks #variable = 0.0.0.0/0
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block] #commented bcuz we use IPV4
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
      Name = "roboshop-all-aws"
  }
}
resource "aws_instance" "web" {
  ami           = "ami-0b4f379183e5706b9" #centos-8-devops-practice ami id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.var.sg-name.id] # syntax linking sg to this instance # this means list


  tags = {
    Name = "REDO-HelloTerraform"
  }
}

resource "aws_security_group" "redo-roboshop-all" { #this is terraform name, for terraform reference only
  name        = var.sg-name #this is for aws sg name
  description = "var.sg-description"
  #vpc_id      = aws_vpc.main.id #if not defined, region's default vpc will be taken

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

#techincally EC2 instance is dependent on sg in order to be created, so sg creation should be given first before ec2 in the file.
#but terraform is automatic depedency management, so doesn't matter what is given first,
#and terraform is declarative sequence need not be followed in terraform # terraform is intelligent enough to create which one 1st 
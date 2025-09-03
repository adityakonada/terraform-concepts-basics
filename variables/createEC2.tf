resource "aws_instance" "web" {
  ami           = var.ami_id            #centos-8-devops-practice ami id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.roboshop-all.id] #[] syntax linking sg to this instance # this means list
  tags = var.tags
}